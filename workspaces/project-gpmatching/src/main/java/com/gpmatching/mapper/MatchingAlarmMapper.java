package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.CloseAlarmDto;
import com.gpmatching.dto.ConfirmAlarmDto;
import com.gpmatching.dto.MatchingAlarmDto;

@Mapper
public interface MatchingAlarmMapper {

	@Insert("insert into MatchingAlarm (alarmContent, commentNo) values ('댓글을 달았습니다', #{ commentNo })")
	@Options(useGeneratedKeys = true, keyProperty = "alarmNo")
	void insertMatchingAlarm(MatchingAlarmDto matchingAlarmDto);

	//승인 테이블 insert
	@Insert("insert into ConfirmAlarm (commentNo, confirmContent) values (#{commentNo},'승인을 했습니다')")
	@Options(useGeneratedKeys = true, keyProperty = "confirmNo")
	void insertConfirmAlarm(ConfirmAlarmDto confirmAlarm);
	
	//마감 알림 테이블 insert
	@Insert("insert into CloseAlarm (boardNo, closeContent) values (#{boardNo}, '신청한 모집이 마감됐습니다')")
	@Options(useGeneratedKeys = true, keyProperty = "closeNo")
	void insertCloseAlarm(CloseAlarmDto closeAlarm);
	
	
	@Select("SELECT result.alarmNo, result.commentNo, result.alarmContent, result.regDate, result.nickname FROM (SELECT ma.alarmNo, ma.commentNo, ma.alarmContent, ma.regDate, u.nickname FROM MatchingComment mc INNER JOIN MatchingAlarm ma ON ma.commentNo = mc.commentNo INNER JOIN User u ON u.userNo = mc.userNo WHERE mc.userNo != ${userNo} UNION SELECT ca.confirmNo, ca.commentNo, ca.confirmContent, ca.regDate, (SELECT u.nickname FROM User u WHERE u.userNo = mb.userNo) AS nickname FROM MatchingComment mc INNER JOIN ConfirmAlarm ca ON ca.commentNo = mc.commentNo INNER JOIN User u ON u.userNo = mc.userNo INNER JOIN MatchingBoard mb ON mb.boardNo = mc.boardNo WHERE (mc.status = 1 AND u.userNo = ${userNo}) UNION SELECT cla.closeNo, cla.boardNo, cla.closeContent, cla.regDate, (SELECT u.nickname FROM User u WHERE u.userNo = mc.userNo) AS nickname FROM MatchingBoard mb INNER JOIN CloseAlarm cla ON cla.boardNo = mb.boardNo INNER JOIN MatchingComment mc ON mc.boardNo = mb.boardNo WHERE (mb.matchingClose = 1 AND mc.userNo = ${userNo})) AS result ORDER BY result.regDate DESC")
	List<MatchingAlarmDto> selectAlarmListByUserNo(int userNo);

	@Select("select count(ma.alarmNo) as mAlarmCount "
			  + "from MatchingComment mc "
			  + "inner join MatchingAlarm ma on ma.commentNo = mc.commentNo "
			  + "inner join User u on u.userNo = mc.userNo "
			  + "where mc.userNo != ${userNo}")
	int countMatchingAlarmNo(int userNo);
	
	@Delete("delete "
		  + "from MatchingAlarm "
		  + "where commentNo "
		  + "in (select mc.commentNo "
		  + "    from MatchingComment mc "
		  + "    inner join User u on u.userNo = mc.userNo "
		  + "    where mc.userNo != ${userNo})")
	void deleteAlarmListByUserNo(@Param("userNo") int userNo);

	@Delete("delete "
		  + "from ConfirmAlarm "
		  + "where commentNo "
		  + "in (select mc.commentNo "
		  + "    from MatchingComment mc "
		  + "    inner join User u on u.userNo = mc.userNo "
		  + "    where mc.userNo = ${userNo})")
	void deleteConfirmListByUserNo(@Param("userNo") int userNo);
	
	
	@Delete("delete "
		  + "from CloseAlarm "
	      + "where boardNo "
		  + "in (select mb.boardNo "
		  + "    from MatchingBoard mb "
		  + "    inner join User u on u.userNo = mb.userNo "
		  + "    inner join MatchingComment mc on mc.boardNo = mb.boardNo "
		  + "    where mc.userNo = ${userNo})")
	void deleteCloseListByUserNo(@Param("userNo") int userNo);

}
