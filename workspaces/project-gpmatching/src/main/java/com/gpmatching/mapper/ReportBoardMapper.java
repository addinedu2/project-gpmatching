package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.ReportBoardDto;

@Mapper
public interface ReportBoardMapper {

	//신고게시판 글쓰기
	@Insert("insert into CommonBoard(commonTitle, commonContent, userNo, category) "
		  + "values (#{commonTitle}, #{commonContent}, #{userNo}, #{category})")
	@Options(useGeneratedKeys = true, keyProperty = "commonNo")
	void insertReportBoard(ReportBoardDto reportBoardDto);
	
	
	//첨부파일
	@Insert("insert into BoardAttach(userFilename, savedFilename, commonNo) "
		  + "values(#{userFilename},#{savedFilename},#{commonNo})")
	@Options(useGeneratedKeys = true, keyProperty = "boardAttachNo")
	void insertReportAttach(BoardAttachDto attach);
	
	//신고 글 전체 조회
	@Select("select u.nickname, cb.commonNo, cb.commonTitle, cb.commonContent, cb.userNo, cb.readCount, cb.regDate, cb.category "
	 	  + "from CommonBoard cb "
		  + "inner join User u "
		  + "on u.UserNo = cb.UserNo "
		  + "where cb.category = 'report' "   //여기서 데이터에서 신고만 뽑아냄
		  + "order by commonNo desc")
	List<ReportBoardDto> selectAllBoard();
	
	//신고게시판 페이지별 조회
	@Select("select u.nickname, cb.commonNo, cb.commonTitle, cb.commonContent, cb.userNo, cb.readCount, cb.regDate, cb.category "
		  + "from CommonBoard cb "
	      + "inner join User u "
		  + "on u.UserNo = cb.UserNo "
		  + "where cb.category = 'report' "   //여기서 데이터에서 신고만 뽑아냄
		  + "order by commonNo desc "
		  + "limit #{from}, #{count}")
	List<ReportBoardDto> selectBoardByPage(@Param("from")int from, @Param("count")int count, @Param("category")String category );
	
	//신고게시판 글 상세 보기
	@Select("select u.nickname, cb.commonNo, cb.commonTitle, cb.commonContent, cb.userNo, cb.readCount, cb.regDate, cb.category "
		  + "from CommonBoard cb "
		  + "inner join User u "
	 	  + "on u.UserNo = cb.UserNo "
	 	  + "where commonNo = #{commonNo} and deleted = false")
	ReportBoardDto selectReportBoardByCommonNo(@Param("commonNo") int commonNo);

	//첨부파일 조회
	@Select("select boardAttachNo, commonNo, userFilename, savedFilename, regDate, downloadCount "
		  + "from BoardAttach "
		  + "where commonNo = #{commonNo}")
	List<BoardAttachDto> selectBoardAttachByCommonNo(@Param("commonNo") int commonNo);
		
	@Select("select boardAttachNo, commonNo, userFilename, savedFilename, regDate, downloadCount "
		  + "from BoardAttach "
		  + "where boardAttachNo = #{boardAttachNo}")
	BoardAttachDto selectBoardAttachByBoardAttachNo(@Param("boardAttachNo") int boardAttachNo);
		
	//게시물 개수 카운트
	@Select("select count(*) from CommonBoard")
	int selectReportBoardCount();
	
	
	
	
}
	