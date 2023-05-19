package com.hideon.myapp.main_share.service.impl;

import com.hideon.myapp.main_share.Entity.MSEntity;

import java.util.List;

public interface MSService {

    List<MSEntity> getAllItem();

    MSEntity createPost(String title, String content, int sort);

//    String createPosts(MSEntity msEntity);

    String deletePostById(Integer num);

    MSEntity updatePost(MSEntity msEntity, Integer num);

}
