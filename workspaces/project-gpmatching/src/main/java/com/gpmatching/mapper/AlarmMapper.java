package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.AlarmDto;

@Mapper
public interface AlarmMapper {

	@Insert("insert into Alarm (commentNo) values (#{commentNo})")
	@Options(useGeneratedKeys = true, keyProperty = "alarmNo", keyColumn="alarmNo")
	void insertAlarm(AlarmDto alarm);
	
	@Select("select distinct a.alarmNo, a.commentNo, bc.userNo, bc.commentContent, bc.commonNo, u.nickname "
	      + "from BoardComment bc "
		  + "inner join Alarm a ON a.commentNo = bc.commentNo "
	      + "inner join User u on u.userNo = bc.userNo "
		  + "inner join CommonBoard cb on cb.userNo = bc.userNo "
	      + "where bc.userNo != #{userNo} and cb.userNo != #{userNo} "
	      + "order by bc.commentNo desc")
	List<AlarmDto> selectAlamListByUserNo(@Param("userNo") int userNo);

	


}
