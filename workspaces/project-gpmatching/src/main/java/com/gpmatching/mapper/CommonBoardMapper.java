package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.CommonBoardDto;

@Mapper
public interface CommonBoardMapper {

	//공통게시판 글쓰기

	@Insert("insert into CommonBoard(commonTitle, commonContent) "
		  + "values (#{commonTitle}, #{commonContent})")
	@Options(useGeneratedKeys = true, keyProperty = "commonNo")
	void insertCommonBoard(CommonBoardDto commonBoardDto);
	
	//공통게시판 글 전체 조회
	@Select("select commonNo, commonTitle, commonContent, userNo, readCount, regDate, deleted "
		  + "from CommonBoard "
		  + "order by commonNo desc")
	List<CommonBoardDto> selectAllBoard();//전체 리스트 가져오기
	
	//공통게시판 페이지별 조회
	@Select("select commonNo, commonTitle, commonContent, userNo, readCount, regDate, deleted "
			  + "from CommonBoard "
			  + "order by commonNo desc "
			  + "limit #{from}, #{count}")
		List<CommonBoardDto> selectBoardByPage(@Param("from")int from, @Param("count")int count);
	
	//공통게시판 글 삭제 표시
	@Select("select commonNo, commonTitle, commonContent, userNo, readCount, regDate, deleted "
		  + "from CommonBoard "
		  + "where commonNo = #{commonNo} and deleted = false")
	CommonBoardDto selectCommonBoardByCommonNo(@Param("commonNo") int commonNo);

	//공통게시판 글 수정
	@Update("update CommonBoard set deleted = true "
		  + "where commonNo = #{commonNo}")
	void deleteCommon(@Param("commonNo") int commonNo);
	
	@Update("update CommonBoard "
		  + "set commonTitle = #{commonTitle},commonContent = #{commonContent} "
		  + "where commonNo = #{commonNo}")
	void updateCommonEdit(CommonBoardDto commonBoardDto);

	//게시물 개수 카운트
	@Select("select count(*) from CommonBoard")
	int selectCommonBoardCount();
	
//	@Insert("insert into boardAttach(userFilename, savedFilename) "
//		  + "values(#{userFilename},#{savedFilename})")
//	@Options(useGeneratedKeys = true, keyProperty = "boardAttachNo")
//	void insertBoardAttach(BoardAttachDto attach);
}
	