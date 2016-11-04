package com.example.dao.mapper;

import com.example.bean.DeveloperLink;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by hengqiangcao on 4/11/16.
 */
public interface DeveloperLinkMapper {

    @Select(value="select * from I_DEVELOPER_LINK where I_DEVELOPER_ID =#{iDeveloperId}")
    @Results(value = {
            @Result(column="ID", property="id"),
            @Result(column="I_DEVELOPER_ID", property="iDeveloperId"),
            @Result(column="LINK_URL", property="linkUrl"),
    })
    List<DeveloperLink> selectIDeveloperLinkByIDeveloperiD(String iDeveloperId);
}
