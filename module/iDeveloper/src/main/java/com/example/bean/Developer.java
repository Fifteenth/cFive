package com.example.bean;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;

/**
 * Created by hengqiangcao on 23/10/16.
 */
public class Developer {

    private String id;
    private String title1;
    private String title2;
    private String title3;
    private String description;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1;
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2;
    }

    public String getTitle3() {
        return title3;
    }

    public void setTitle3(String title3) {
        this.title3 = title3;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}