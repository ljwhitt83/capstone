package com.web.capstone.webUtils;

import com.web.capstone.model.ImageFiles;
import com.web.capstone.model.Products;
import com.web.capstone.repository.AccountsRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

@Component
@Transactional
public class WebUtils {
    private static final Logger log= LoggerFactory.getLogger("WebUtils.class");

    @Autowired
    private JavaMailSender sender;

    @Autowired
    private AccountsRepository userRepository;

    @Autowired
    HttpServletRequest request;

    @Autowired
    private com.web.capstone.repository.ImageRepository ImageRepository;


    private static final String UPLOADED_FOLDER = "static"+ File.separator +"img";

    public void sendMail(String to, String msg, String subject) throws MessagingException {
        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setTo(to);
        helper.setText(msg);
        helper.setSubject(subject);
        sender.send(message);

    }


    public void addProfilePhoto(MultipartFile file, long id, String folder) throws Exception {
        try {
            // save dir
            String destDir = request.getSession().getServletContext().getRealPath(UPLOADED_FOLDER)+ File.separator +folder+ File.separator +id+ File.separator +"profile";
            log.info("This is path {}", destDir);

            //innitalize file
            File dir = new File(destDir);
            //if folder does not exist create it
            if(!dir.exists()){
                new File(destDir).mkdirs();
            }

            MultipartFile multipartFile = (MultipartFile) file;
            String fileName = file.getOriginalFilename(); //set

            String img= userRepository.findById(id).get().getImage();

            File doc = new File(destDir + File.separator + img);
            if(doc.exists()) {
                doc.delete();
            }

            //rename file to md5
            String parseMd5=md5(fileName.toLowerCase());
            File destination = new File(destDir + File.separator + parseMd5);
            //save to file system and db
            multipartFile.transferTo(destination);
            userRepository.findById(id).ifPresent(
                    a->{
                        a.setImage(parseMd5);
                    });

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Add method for multiple file upload in WebUtils.java
    public void saveImages(Products product) throws Exception {
        MultipartFile[] files=product.getFile();
        String realPathtoUploads = request.getSession().getServletContext().getRealPath(UPLOADED_FOLDER);
        File dir = new File(realPathtoUploads+ File.separator + File.separator + "products"+ File.separator + product.getId());

        if (!dir.exists())
            dir.mkdirs();
        List<String> fileNames = new ArrayList<String>();
        if (files!=null &&  files.length > 0) {
            for (MultipartFile file : files) {
                String fileName = file.getOriginalFilename();
                String parseMd5=md5(fileName.toLowerCase());
                fileNames.add(parseMd5);

                if(!fileName.isEmpty()) {
                    String filePath = realPathtoUploads + File.separator + File.separator + "products"+ File.separator + product.getId()+ File.separator + parseMd5;
                    ImageFiles images= new ImageFiles();
                    //save to database
                    images.setImage(parseMd5);
                    images.setStockId(product.getId());
                    images.setSize(file.getSize());
                    images.setExt(file.getContentType());
                    ImageRepository.save(images);
                    //save to web folder
                    File destination = new File(filePath);
                    //file.transferTo(destination);
                    file.transferTo(destination);
                }
            }
        }
    }

    public String removefile(long id, String image, String folder) {
        try {

            String realPathtoUploads =
                    request.getServletContext()
                            .getRealPath(UPLOADED_FOLDER+ File.separator +folder);
            File doc = new File(realPathtoUploads + File.separator
                    + id+ File.separator +image+"");
            //log.info("Path #### {}", realPathtoUploads);
            if(doc.exists()) {
                doc.delete();
                // log.info("deleted #### {}", image);
            }


        } catch (Exception e) {
            e.printStackTrace();
            return "Delete operation is failed.";
        }

        return "Delete Success.";
    }

    public String removefolder(long id, String folder) {
        try {

            String realPathtoUploads =
                    request.getSession().getServletContext()
                            .getRealPath(UPLOADED_FOLDER+ File.separator +folder);

            File file = new File(realPathtoUploads + File.separator + id);

            FileSystemUtils.deleteRecursively(file);


        } catch (Exception e) {
            e.printStackTrace();
            return "Delete operation is failed.";
        }
        return "Delete Success.";
    }

    public void getFiles(Model model, long id, String folder) {
        List<String> results = new ArrayList<String>();
        try {
            String realPathtoUploads =
                    request.getSession().getServletContext().getRealPath(UPLOADED_FOLDER+ File.separator +folder);

            File[] files = new File(realPathtoUploads + File.separator + id).listFiles();
            for (File file : files) {
                if (file.isFile()) {
                    results.add(file.getName());
                    model.addAttribute("filenames", results);
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    public String md5(String filename) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        String hash = DatatypeConverter.printHexBinary(MessageDigest.getInstance("MD5").digest(filename.getBytes("UTF-8")));
        return hash;
    }

}
