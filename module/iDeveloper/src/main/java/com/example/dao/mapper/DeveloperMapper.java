package com.example.dao.mapper;

import com.example.bean.Developer;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by hengqiangcao on 23/10/16.
 */
public interface DeveloperMapper {

    @Select(value="select * from I_Developer")
    @Results(value = {
            @Result(column="TITLE_1", property="title1"),
            @Result(column="TITLE_2", property="title2"),
            @Result(column="TITLE_3", property="title3"),
            @Result(column="Name", property="name")
    })
    List<Developer> selectIDeveloper();
}
