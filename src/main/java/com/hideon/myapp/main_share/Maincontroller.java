package com.hideon.myapp.main_share;

import com.hideon.myapp.main_share.Entity.MSEntity;
import com.hideon.myapp.main_share.service.impl.MSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("main")

public class Maincontroller {

    @Autowired
    MSService msService;

    @GetMapping("")
    public String getAllUser(Model model){
        model.addAttribute("list",msService.getAllItem());
        return "main";
    }

    @PostMapping("create")
    public String createPosts( @RequestParam("title") String title,
                               @RequestParam("content") String content,@RequestParam int sort){
        msService.createPost(title,content,sort);
        return "redirect:/main";
    }

    @PostMapping("/update/{num}")
    public MSEntity postposts(@PathVariable("num") Integer num, @RequestBody MSEntity msEntity){

        System.out.println("-------------------------------------------------------");
        return msService.updatePost(msEntity,num);
    }

    @PostMapping("/delete/{num}")
    public String deletePostById(@PathVariable Integer num){
        msService.deletePostById(num);
        return "redirect:/main";
    }

}

//    @RequestMapping("/")
//    public String findall(Model model){
//        model.addAttribute("name",msRepository.findAll());
//        System.out.println(msRepository.findAll());
//        System.out.println("gdgd");
//        return "main";
//
//    }

