package com.web.capstone.controller;

import com.web.capstone.model.Products;
import com.web.capstone.repository.ImageRepository;
import com.web.capstone.repository.ProductRepository;
import com.web.capstone.webUtils.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@SessionAttributes({"loggedInUser", "role"})
public class ProductController {

    public static final Logger log= LoggerFactory.getLogger("ProductController.class");

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private WebUtils webUtils;

    @Autowired
    ImageRepository imageRepository;

    @PostMapping("saveproduct")
    String saveproduct(@ModelAttribute Products pro, RedirectAttributes redirect) throws IllegalStateException, IOException {

        try {

            MultipartFile[] file=pro.getFile();
            if(file.length>0) {
                // String fileName = file[0].getOriginalFilename();
                String parseMd5=webUtils.md5(file[0].getOriginalFilename().toLowerCase());
                pro.setImg(parseMd5);}

            productRepository.save(pro);
            webUtils.saveImages(pro);
            redirect.addFlashAttribute("msg", "Product Saved");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:/shop";
    }


    @PostMapping("editproduct")
    String editproduct(@ModelAttribute Products pro, RedirectAttributes redirect) throws IllegalStateException, IOException {

        try {

            productRepository.save(pro);
            MultipartFile[] file=pro.getFile();
            if(file.length>0) {
                webUtils.saveImages(pro);
            }
            redirect.addFlashAttribute("msg", "Product Updated");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "redirect:productdetails?id="+pro.getId();
    }

    @GetMapping("setimg")
    String setimg(@RequestParam Long id, @RequestParam String img) {
        productRepository.findById(id).ifPresent(a->{
            a.setImg(img);
            productRepository.save(a);
        });

        return "redirect:productdetails?id="+id;
    }

    @GetMapping("removeimg")
    String deleteimg(@RequestParam Long id, @RequestParam Long imgid,  @RequestParam String img, RedirectAttributes redirect) {

        imageRepository.deleteById(imgid);
        webUtils.removefile(id, img, "products");
        redirect.addFlashAttribute("msg", "Product Image Deleted");
        return "redirect:productdetails?id="+id;
    }

    @GetMapping("deleteproduct")
    String deleteproduct(@RequestParam Long id,  RedirectAttributes redirect) {
        productRepository.deleteById(id);
        webUtils.removefolder(id, "products");
        redirect.addFlashAttribute("msg", "Product Image Deleted");

        return "redirect:shop";
    }

    @GetMapping("productdetails")
    String single(@RequestParam Long id, Model model) {

        List<Products> products=productRepository.findAll();

        List<Products> itemList = products
                .stream()
                .filter(a->a.getId().equals(id))
                .collect(Collectors.toList());

        model.addAttribute("item", itemList.get(0));
        model.addAttribute("list", products.subList(0, products.size()));
        model.addAttribute("product", itemList.get(0));

        return "item-detail";
    }

    @GetMapping("shop")
    String shop(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
                @RequestParam(value = "size", defaultValue = "4", required = false) Integer size){

        Page<Products> findAllPagable = productRepository.findAll(PageRequest.of(page, size, Sort.by("id")));
        model.addAttribute("list", findAllPagable);
        model.addAttribute("page", "Shop");


        return "shop";
    }

    @PostMapping("filter")
    String filter(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
                  @RequestParam(value = "size", defaultValue = "4", required = false) Integer size, String section){

        Page<Products> findAllPagable = productRepository.filter(section, PageRequest.of(page, size, Sort.by("name")));
        model.addAttribute("list", findAllPagable);
        model.addAttribute("msg", section);

        return "shop";
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
}
