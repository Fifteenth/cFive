package com.example.service;

import com.example.bean.DeveloperLink;
import com.example.dao.mapper.DeveloperLinkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hengqiangcao on 4/11/16.
 */
@Service
public class DeveloperLinkService {

    @Autowired
    private DeveloperLinkMapper developerLinkMapper;


    public List<DeveloperLink> selectIDeveloperLinkByIDeveloperiD(String iDeveloperId){
        return developerLinkMapper.selectIDeveloperLinkByIDeveloperiD(iDeveloperId);
    }
}
