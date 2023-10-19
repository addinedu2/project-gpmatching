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
	
	
	@Select("select result.alarmNo, result.commentNo, result.alarmContent, result.regDate, result.nickname "
			  + "from "
			  + "     (select ma.alarmNo, ma.commentNo, ma.alarmContent, ma.regDate, u.nickname "
			  + "      from MatchingComment mc "
			  + "      inner join MatchingAlarm ma on ma.commentNo = mc.commentNo "
			  + "      inner join User u on u.userNo = mc.userNo "
			  + "      where mc.userNo != ${userNo} "
			  + "      union "
			  + "      select ca.confirmNo, ca.commentNo, ca.confirmContent, ca.regDate, "
			  + "            (select u.nickname "
			  + "             from User u "
			  + "             where u.userNo = mb.userNo) as nickname "
			  + "             from MatchingComment mc "
			  + "             inner join ConfirmAlarm ca on ca.commentNo = mc.commentNo "
			  + "             inner join User u on u.userNo = mc.userNo "
			  + "             inner join MatchingBoard mb on mb.boardNo = mc.boardNo "
			  + "             where (mc.status = 1 and u.userNo = ${userNo}) "
			  + "             union "
			  + "             select cla.closeNo, cla.boardNo, cla.closeContent, cla.regDate, "
			  + "                   (select u.nickname "
			  + "                    from User u where u.userNo = mc.userNo) as nickname "
			  + "                    from MatchingBoard mb "
			  + "                    inner join CloseAlarm cla on cla.boardNo = mb.boardNo "
			  + "                    inner join MatchingComment mc on mc.boardNo = mb.boardNo "
			  + "                    where (mb.matchingClose = 1 and mc.userNo = ${userNo})) as result "
			  + "                    order by result.regDate desc")
	List<MatchingAlarmDto> selectAlarmListByUserNo(int userNo);

	@Select("SELECT (SELECT COUNT(alarmNo) "
			  + "FROM MatchingAlarm "
			  + "WHERE commentNo IN "
			  + "    ( SELECT mc.commentNo "
			  + "      FROM MatchingComment mc "
			  + "      INNER JOIN User u ON u.userNo = mc.userNo "
			  + "      WHERE mc.userNo != ${userNo}) ) "
			  + "      + (SELECT COUNT(confirmNo) "
			  + "         FROM ConfirmAlarm "
			  + "         WHERE commentNo IN "
			  + "              ( SELECT mc.commentNo "
			  + "                FROM MatchingComment mc "
			  + "                INNER JOIN User u ON u.userNo = mc.userNo "
			  + "                WHERE mc.userNo = ${userNo}) ) "
			  + "                + (SELECT COUNT(closeNo) "
			  + "                   FROM CloseAlarm "
			  + "                   WHERE boardNo IN "
			  + "                  ( SELECT mb.boardNo "
			  + "                    FROM MatchingBoard mb "
			  + "                    INNER JOIN User u ON u.userNo = mb.userNo "
			  + "                    INNER JOIN MatchingComment mc ON mc.boardNo = mb.boardNo "
			  + "                    WHERE mc.userNo = ${userNo}) ) AS TotalCount;")
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
