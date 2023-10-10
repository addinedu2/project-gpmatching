package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.CommonBoardDto;

@Mapper
public interface CommonBoardMapper {

	//공통게시판 글쓰기
	@Insert("insert into CommonBoard(commonTitle, commonContent, userNo, category) "
		  + "values (#{commonTitle}, #{commonContent}, #{userNo}, #{category})")

	@Options(useGeneratedKeys = true, keyProperty = "commonNo")
	void insertCommonBoard(CommonBoardDto commonBoardDto);
	
	
	//첨부파일
	@Insert("insert into BoardAttach(userFilename, savedFilename, commonNo) "
		  + "values(#{userFilename},#{savedFilename},#{commonNo})")
	@Options(useGeneratedKeys = true, keyProperty = "boardAttachNo")
	void insertBoardAttach(BoardAttachDto attach);
	
	//공통게시판 글 전체 조회
	@Select("select u.nickname, cb.commonNo, cb.commonTitle, cb.commonContent, cb.userNo, cb.readCount, cb.regDate, cb.deleted, cb.category "
	 	  + "from CommonBoard cb "
		  + "inner join User u "
		  + "on u.userNo = cb.userNo "
		  + "where cb.category = 'common' and cb.deleted = false "   //여기서 데이터에서 공통만 뽑아냄, 위에서 데이터 가져오는거, 아래서 데이터 가져갈 것도 신경 쓸 것
		  + "order by commonNo desc")
	List<CommonBoardDto> selectAllBoard();
	
	//공통게시판 페이지별 조회
	@Select("select u.nickname, cb.commonNo, cb.commonTitle, cb.commonContent, cb.userNo, cb.readCount, cb.regDate, cb.deleted, cb.category "
		  + "from CommonBoard cb "
	      + "inner join User u "
		  + "on u.userNo = cb.userNo "
		  + "where cb.category = 'common' and cb.deleted = false "   //여기서 데이터에서 공통만 뽑아냄, 위에서 데이터 가져오는거, 아래서 데이터 가져갈 것도 신경 쓸 것
		  + "order by commonNo desc "
		  + "limit #{from}, #{count}")
	List<CommonBoardDto> selectBoardByPage(@Param("from")int from, @Param("count")int count, @Param("category")String category );
	
	//공통게시판 글 상세 보기

	@Select("select u.nickname, cb.commonNo, cb.commonTitle, cb.commonContent, cb.userNo, cb.readCount, cb.regDate, cb.deleted "
		  + "from CommonBoard cb "
		  + "inner join User u "
	 	  + "on u.userNo = cb.userNo "
	 	  + "where commonNo = #{commonNo} and deleted = false")
	CommonBoardDto selectCommonBoardByCommonNo(@Param("commonNo") int commonNo);

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
	@Select("select count(*) from CommonBoard "
			+ "where category = 'common' and deleted = false")
	int selectCommonBoardCount();
	
	//공통게시판 글 수정
	@Update("update CommonBoard set deleted = true "
		  + "where commonNo = #{commonNo}")
	void deleteCommon(@Param("commonNo") int commonNo);
	
	@Update("update CommonBoard "
		  + "set commonTitle = #{commonTitle},commonContent = #{commonContent} "
		  + "where commonNo = #{commonNo}")
	void updateCommonEdit(CommonBoardDto commonBoardDto);
	
	//게시물 조회수 증가
	@Update("update CommonBoard "
			  + "set readCount = COALESCE(readCount,0) + 1 "
			  + "where commonNo = #{commonNo}")
	void incrementReadCount(@Param("commonNo") int commonNo);

	//댓글 개수 카운트
		@Select("select count(*) "
				+ "from BoardComment "
				+ "where commonNo = #{ commonNo } ")
		int selectBoardByCommentCount(@Param("commonNo") int commonNo);
	
}
	