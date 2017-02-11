package com.example.service;

import com.example.bean.Developer;
import com.example.dao.mapper.DeveloperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

/**
 * Created by hengqiangcao on 23/10/16.
 */
@Service
public class DeveloperService {

    @Autowired
    private DeveloperMapper developerMapper;

    public List<Developer> selectIDeveloper(Developer developer){
        if(developer == null){
            developer = new Developer();
            Timestamp timestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
            developer.setCreateTime(timestamp);
        }
        return  (List<Developer>) developerMapper.selectIDeveloper(developer);
    }

    public Developer selectIDeveloperById(String id){
        return  developerMapper.selectIDeveloperById(id);
    }

    public void saveIDeveloper(Developer developer){
        developerMapper.saveIDeveloper(developer);
    }

    public void updateDeveloper(Developer developer){
        developerMapper.updateIDeveloper(developer);
    }
}
