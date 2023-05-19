//package com.hideon.myapp.main_share;
//
//import com.hideon.myapp.main_share.Entity.MSEntity;
//import com.hideon.myapp.main_share.service.impl.MSService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestController
//public class Cont {
//    @Autowired
//    MSService msService;
//    @PostMapping("/update/{num}")
//    public MSEntity postposts(@PathVariable("num") Integer num, @RequestBody MSEntity msEntity ){
//
//        return msService.updatePost(num,);
//    }
//
//    @GetMapping("/aa")
//    public List<MSEntity> getAllUser(Model model){
//        model.addAttribute("list",msService.getAllItem());
//        return msService.getAllItem();
//    }
//}
