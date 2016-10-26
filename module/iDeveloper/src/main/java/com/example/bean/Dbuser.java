package com.example.bean;

import java.util.Date;

/**
 * Created by hengqiangcao on 24/10/16.
 */
public class Dbuser implements java.io.Serializable {

    private String userId;
    private String username;
    private String createdBy;
    private Date createdDate;

    public Dbuser() {
    }

    public Dbuser(String userId) {
        this.userId = userId;
    }

    public Dbuser(String userId, String username, String createdBy,
                  Date createdDate) {
        this.userId = userId;
        this.username = username;
        this.createdBy = createdBy;
        this.createdDate = createdDate;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return this.createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

}
