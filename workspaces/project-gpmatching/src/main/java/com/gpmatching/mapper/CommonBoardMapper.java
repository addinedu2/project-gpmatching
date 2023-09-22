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

	@Insert("insert into commonboard(commonTitle,commonContent) "
		  + "values (#{commonTitle},#{commonContent})")
	
	@Options(useGeneratedKeys = true, keyProperty = "commonNo")
	void insertCommonBoard(CommonBoardDto commonBoardDto);
	
	@Select("select commonNo, commonTitle, commonContent, userNo, readCount, regDate, deleted "
		  + "from commonBoard "
		  + "order by commonNo desc")
	List<CommonBoardDto> selectAllBoard();//전체 리스트
	
	@Select("select commonNo, commonTitle, commonContent, userNo, readCount, regDate, deleted "
			  + "from commonBoard "
			  + "order by commonNo desc "
			  + "limit #{from}, #{count}")
		List<CommonBoardDto> selectBoardByPage(@Param("from")int from, @Param("count")int count);
	
	
	@Select("select commonNo, commonTitle, commonContent, userNo, readCount, regDate, deleted "
		  + "from commonBoard "
		  + "where commonNo = #{commonNo} and deleted = false")
	CommonBoardDto selectCommonBoardByCommonNo(@Param("commonNo") int commonNo);

	
	@Update("update commonboard set deleted = true "
		  + "where commonNo = #{commonNo}")
	void deleteCommon(@Param("commonNo") int commonNo);
	
	@Update("update commonboard "
		  + "set commonTitle = #{commonTitle},commonContent = #{commonContent} "
		  + "where commonNo = #{commonNo}")
	void updateCommonEdit(CommonBoardDto commonBoardDto);

	
	@Select("select count(*) from commonboard")
	int selectCommonBoardCount();
	
//	@Insert("insert into boardAttach(userFilename, savedFilename) "
//		  + "values(#{userFilename},#{savedFilename})")
//	@Options(useGeneratedKeys = true, keyProperty = "boardAttachNo")
//	void insertBoardAttach(BoardAttachDto attach);
}
	