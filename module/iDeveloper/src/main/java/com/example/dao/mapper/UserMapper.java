package com.example.dao.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.bean.User;

/**
 * 用户数据映射
 * Created by admin on 16/8/8.
 */
public interface UserMapper {

    @Select(value="select username,password,enabled from IDEVELOPER_BASE_USERS where username = #{username}")
    User loadUserByUsername(@Param("username") String username);
    @Insert(value="insert into IDEVELOPER_BASE_USERS (username, password, enabled, create_date) value(#{username},#{password},#{enabled},#{createDate})")
    void saveUser(User user);
}
