package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.AlramDto;

@Mapper
public interface AlramMapper {

	@Insert("insert into Alram (commentNo) values (#{commentNo})")
	@Options(useGeneratedKeys = true, keyProperty = "alramNo", keyColumn="alramNo")
	void insertAlram(AlramDto alram);
	
	@Select("select a.alramNo, a.commentNo, bc.userNo, bc.commentContent, bc.commonNo, u.nickname "
		  + "from BoardComment bc "
		  + "inner join Alram a ON a.commentNo = bc.commentNo "
		  + "inner join User u on u.userNo = bc.userNo "
		  + "where bc.userNo = #{userNo} order by bc.commentNo desc")
	List<AlramDto> selectAlamListByUserNo(@Param("userNo") int userNo);


}
