package com.hideon.myapp.main_share.service.impl;

import com.hideon.myapp.main_share.Entity.MSEntity;
import com.hideon.myapp.main_share.MSRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class MSServiceImpl implements MSService{
    @Autowired
    MSRepository msRepository;
    @Autowired
    public MSServiceImpl(MSRepository msRepository){
        this.msRepository= msRepository;
    }

    @Override
    public List<MSEntity> getAllItem() {
        System.out.println(msRepository.findAll().size());
        return msRepository.findAll();
    }
    @Override
    public MSEntity createPost(String title, String content, int sort) {
        MSEntity msEntity = new MSEntity();
        msEntity.setTitle(title);
        msEntity.setContent(content);
        msEntity.setSort(sort);
        LocalDateTime date = LocalDateTime.now();
        String sDate=date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        msEntity.setCreated_at(sDate);
        msEntity.setView_count(0);
        return msRepository.save(msEntity);
    }


    @Override
    public String deletePostById(Integer num) {
        msRepository.deleteById(num);
        System.out.println("--------------------------");
        return null;
    }



    @Override
    public MSEntity updatePost(MSEntity msEntity,Integer num) {
        if (msRepository.findById(num).isPresent()) {
            MSEntity post = msRepository.findById(num).get();
            post.setTitle(msEntity.getTitle());
            post.setContent(msEntity.getContent());
            System.out.println(post.getContent());
            System.out.println("@@@@@@@@@@@@@@@1!@@@@");
            msRepository.save(post);
            return post;
        } else{
            System.out.println("############################");
          return msEntity;
        }
    }

}


