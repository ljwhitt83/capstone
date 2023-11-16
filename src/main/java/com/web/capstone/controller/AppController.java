package com.web.capstone.controller;

import com.web.capstone.model.*;
import com.web.capstone.repository.AccountsRepository;
import com.web.capstone.repository.AddressRepository;
import com.web.capstone.repository.PaymentMethodRepository;
import com.web.capstone.repository.RoleRepository;
import com.web.capstone.webUtils.DataValidation;
import com.web.capstone.webUtils.States;
import com.web.capstone.webUtils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@SessionAttributes({"loggedInUser","role", "avatar"})
public class AppController {

    @Autowired
    private AccountsRepository accountsRepository;

    @Autowired
    private DataValidation dataValidation;

    @Autowired
    private WebUtils webUtils;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping({"home", "/", "index"})
    public String home(Model model){
        model.addAttribute("msg", "Home page");
        return "index";
    }

    @GetMapping("about")
    public String about(Model model){
        model.addAttribute("msg", "This is the about me page");
        return "about";
    }

    @GetMapping("contact")
    public String contact(Model model){
        model.addAttribute("msg", "Contact us");
        return "contact";
    }

    @GetMapping("Register")
    public String register(Model model){
        model.addAttribute("accounts", new Accounts());
        return "signup";
    }

    @PostMapping("register")
    String register(@ModelAttribute Accounts account, BindingResult result, Model model) {
        try {
            dataValidation.validate(account, result);
            if(result.hasErrors()){
                return "signup";
            }
            //save users and put in sesison
            account.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole("USER"))));
            accountsRepository.save(account);
            model.addAttribute("loggedInUser", account.getEmail());
            model.addAttribute("role", "USER");
        }catch (Exception e){
            e.printStackTrace();
        }
        return "profile";
    }

    @GetMapping("profile")
    public String profile(Model model, @SessionAttribute(required = false) String loggedInUser){
        try {
            if(loggedInUser==null || loggedInUser.isEmpty()){
                model.addAttribute("error", "please login");
                return "login";
            }
            accountsRepository.findByEmail(loggedInUser).ifPresent(a->{
                model.addAttribute("avater", "/static/img/users/" + a.getId() + "/profile/" + a.getImage()+ "");
                model.addAttribute("user_account", a);
                if(a.getAddress()!=null){
                    model.addAttribute("address", a.getAddress());
                }
            });

        }catch (Exception e){
            e.printStackTrace();
        }
        return "profile";
    }

    @GetMapping("admin")
    public String amins(Model model, RedirectAttributes red, @SessionAttribute(required=false) String role) {

        if(role==null || role.isEmpty()) {
            model.addAttribute("error", "Please login/Session Expired ");
            return "login";
        }
        if(role==null || role.isEmpty() || role.equals("USER") ) {
            red.addFlashAttribute("denied", "protected resource, Access denied ");
            return "redirect:profile";
        }
        model.addAttribute("list", accountsRepository.findAll());
        model.addAttribute("msg", "Welcome to Admin Page");

        return "admin";

    }

    @GetMapping("deleteaccout")
    public String remove(@RequestParam Long id, RedirectAttributes red) {

        try {
            accountsRepository.deleteById(id);
            red.addFlashAttribute("success", "Delete success");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:/admin";

    }


    @GetMapping("removeaccout")
    public String removeaccout(@RequestParam String email, RedirectAttributes red) {

        try {
            Accounts a=accountsRepository.findByEmail(email).get();
            accountsRepository.delete(a);

            red.addFlashAttribute("success", "Delete success");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:/admin";

    }

    @PostMapping("search")
    public String search(Model model, @RequestParam String keyword) {

       /* Page<?> findAllPageable = accountsRepository.customeseache(keyword, PageRequest.of(0, 4, Sort.by("fName").descending()));
        model.addAttribute("list", findAllPageable);*/

        return "users";
    }


    @PostMapping("updateUsers")
    @Transactional
    public String updateUsers(@ModelAttribute Accounts user) {

        try {
            //accountsRepository.save(user);
            accountsRepository.findById(user.getId()).ifPresent(a->{
                a.setfName(user.getfName());
                a.setlName(user.getlName());
                //accountsRepository.save(a);
            });

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:admin";
    }

    @PostMapping("customesearch")
    public String ccustomesearch(@RequestParam String email, @RequestParam String name, Model model) {
        model.addAttribute("page", "Admin");
        List<Accounts> users=accountsRepository.search(email, name);
        if(users.isEmpty()) {
            model.addAttribute("msg", " No match found");
        }else {
            model.addAttribute("list", users);
            model.addAttribute("msg", users.size()+ " found");
        }
        return "admin";
    }

    @GetMapping("login")
    public String login(Model model, String error) {

        model.addAttribute("msg", "Please enter your user information");

        return "login";
    }


    @PostMapping("login")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {

        Optional<Accounts> acc=accountsRepository.login(email.trim(), password.trim());

        if(acc.isPresent()) {
            model.addAttribute("loggedInUser", email);
            model.addAttribute("role", acc.get().getRole());
            model.addAttribute("avatar", "static/img/users/"+acc.get().getId()+"/profile/"+acc.get().getImage()+"");
            return "redirect:profile";
        }
        model.addAttribute("msg", "Please enter your user information");
        model.addAttribute("error", "Invalid credentials.");

        return "login";
    }

    @GetMapping("logout")
    public String logout(Model model, HttpSession session) {

        session.invalidate();
        model.addAttribute("loggedInuser", "");
        model.addAttribute("role", "");
        model.addAttribute("msg", "You have been logged out.");
        model.addAttribute("avater", "");

        return "login";
    }

    @PostMapping("editrole")
    @Transactional
    public String roles(String role, Long id) {

        try {
            //accountsRepository.findById(id).get().setRole(role);
            accountsRepository.findById(id).
                    ifPresent(a->{
                        a.setRole(role);
                        if(role.equals("ADMIN")) {
                            a.setRoles(new HashSet<Role>(roleRepository.findAll()));
                            //accountsRepository.save(a);
                        }
                        else {
                            a.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole(role))));
                            //accountsRepository.save(a);
                        }
                    });
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return "redirect:admin";

    }

    @PostMapping("sendemail")
    String sendemail(@RequestParam String email,
                     @RequestParam String name,
                     @RequestParam(required=false) String tel,
                     @RequestParam String subject,
                     @RequestParam String message, RedirectAttributes red) {

        try {
            webUtils.sendMail(email, message+"\nFrom "+ name, subject);
            red.addFlashAttribute("success", "Your message has been sent. Thank you! "+ name);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            red.addFlashAttribute("error", "Email fail! ");
        }

        return "redirect:contact";
    }

    @PostMapping("emailme")
    String emailme(@RequestParam String email,
                   @RequestParam String name,
                   @RequestParam(required=false) String tel,
                   @RequestParam String subject,
                   @RequestParam String message, RedirectAttributes red) {

        try {
            webUtils.sendMail(email, message+"\nFrom "+ name, subject);
            red.addFlashAttribute("success", "Your message has been sent. Thank you! "+ name);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            red.addFlashAttribute("error", "Email fail! ");
        }

        return "redirect:users";
    }

    @PostMapping("/addimages")
    public String add(@RequestParam("file") MultipartFile file,
                      @RequestParam Long id, RedirectAttributes model) {

        Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg))$)");
        try {

            if(file != null && file.isEmpty()){
                model.addFlashAttribute("error", "Error No file Selected ");
                return "redirect:profile";
            }
            if(file.getSize()>1073741824){
                model.addAttribute("error","File size "+file.getSize()+"KB excceds max allowed, try another photo ");
                return "redirect:profile";
            }
            Matcher mtch = ext.matcher(file.getOriginalFilename());

            if (!mtch.matches()) {
                model.addFlashAttribute("error", "Invalid Image type ");
                return "redirect:profile";
            }

            webUtils.addProfilePhoto(file, id, "users");

            model.addFlashAttribute("msg", "Upload success "+ file.getSize()+" KB");

        } catch (Exception e) {
            //e.printStackTrace);
        }

        return "redirect:profile";
    }

    @GetMapping("/users")
    public String users(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
                        @RequestParam(value = "size", defaultValue = "2", required = false) Integer size) {

        try {
            Page<Accounts> findAllPagable = accountsRepository.findAll(PageRequest.of(page, size, Sort.by("id")));
            model.addAttribute("list", findAllPagable);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "users";
    }

    @PostMapping("updatecontact")
    String update(@ModelAttribute Addresses addresses, Model model) {

        try {
            //Accounts user=accountsRepository.findById(addressess.getId()).get();
            //addressess.setAccounts(user);
            addressRepository.save(addresses);
            model.addAttribute("msg", "Update success");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:profile";

    }

    @PostMapping("addcard")
    String addcard(@ModelAttribute PaymentMethod payment, Model model) {

        try {
            // example credit card validation
            String mastercard="/^(?:5[1-5]|222[1-9]|22[3-9][0-9]|2[3-6][0-9][0-9]|27[0-1][0-9]|2720)\\d+$/";

            if(payment.getCardno().matches(mastercard)) {
                payment.setType("Mastercard");
            }

            else {
                payment.setType("Visa");
            }
            //Accounts user=accountsRepository.findById(payment.getId()).get();
            //payment.setAccounts(user);
            paymentMethodRepository.save(payment);
            model.addAttribute("msg", "Card Added");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:profile";

    }

    @GetMapping("/deletecard")
    public String delcard(Long id){
        paymentMethodRepository.deleteById(id);

        return "redirect:profile";
    }


    @PostMapping("changepassword")
    String register(@ModelAttribute Accounts user, RedirectAttributes mod) {
        String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";

        accountsRepository.findById(user.getId()).ifPresent(a->{

            if(!a.getPassword().equals(user.getPassword())) {
                mod.addFlashAttribute("error", "Password is different from current one");
            }

            if(!user.getPassword2().matches(passwordRegex)) {
                mod.addFlashAttribute("error", "Password should be at least 8 characters, lower case, upper case and a special character.");
            }

            if(a.getPassword().equals(user.getPassword()) && user.getPassword2().matches(passwordRegex)) {
                a.setPassword(user.getPassword2());
                accountsRepository.save(a);
                mod.addFlashAttribute("msg", "Password reset success");
            }

        });

        return "redirect:profile";

    }

    @GetMapping("expired")
    String expired(Model model) {
        model.addAttribute("error", "You have been logged out due to inactivity");
        return "login";

    }

    @ModelAttribute("sizes")
    public List<String> size() {
        List<String> size = new ArrayList<String>();
        size.add("S");
        size.add("M");
        size.add("L");
        size.add("XL");
        size.add("2X");
        size.add("3X");
        size.add("FREE SIZE");
        return size;
    }

    @ModelAttribute("cols")
    public List<String> colour() {
        List<String> col = new ArrayList<String>();
        col.add("Blue");
        col.add("Brown");
        col.add("Black");
        col.add("White");
        col.add("Green");
        col.add("Gray");
        col.add("Red");
        col.add("Yellow");
        col.add("Pink");
        col.add("Tan");
        col.add("Purple");
        col.add("Maroon");
        col.add("Gold");
        col.add("Silver");
        return col;
    }

    @ModelAttribute("product")
    Products prod() {
        return new Products();
    }

    @ModelAttribute("card")
    PaymentMethod pay() {
        return new PaymentMethod();
    }

    @ModelAttribute("address")
    Addresses address() {
        return new Addresses();
    }

    @ModelAttribute("states")
    public List<States> populateStates(){
        return Arrays.asList(States.values());
    }

    @ModelAttribute("user")
    public Accounts user() {
        return new Accounts();
    }



}
