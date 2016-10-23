package com.example.service;

import com.example.bean.Developer;
import com.example.dao.mapper.DeveloperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hengqiangcao on 23/10/16.
 */
@Service
public class DeveloperService {

    @Autowired
    private DeveloperMapper developerMapper;


    public List<Developer> selectIDeveloper(){
        return  (List<Developer>) developerMapper.selectIDeveloper();
    }
}
