package com.example.dao.mapper;

import com.example.bean.Developer;
import org.apache.ibatis.annotations.*;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by hengqiangcao on 23/10/16.
 */
public interface DeveloperMapper {

//    @Select(value="select * from I_Developer")
//    @Results(value = {
//            @Result(column="TITLE_1", property="title1"),
//            @Result(column="TITLE_2", property="title2"),
//            @Result(column="TITLE_3", property="title3"),
//            @Result(column="NAME", property="name"),
//            @Result(column="LINK", property="link"),
//            @Result(column="CREATE_TIME", property="createTime")
//    })
    List<Developer> selectIDeveloper(Developer developer);


    Developer selectIDeveloperById(@Param("id") String id);



    @Insert(value = "INSERT INTO I_Developer VALUES (\n" +
            "UUID()," +
            "#{title1}, " +
            "#{title2}, " +
            "#{title3}," +
            "#{name}," +
            "#{description}," +
            "#{link}," +
            "'five'," +
            "now()," +
            "now())")
    void saveIDeveloper(Developer developer);

    void updateIDeveloper(Developer developer);
}
