package com.ys.project.dao.warningBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.WarningBoardVO;

public interface WarningBoardMapper {

	public void insert(WarningBoardVO warningBoardVO);

	public WarningBoardVO read(long no_num);

	public int delete(long no_num);

	public int update(WarningBoardVO warningBoardVO);
	
	public List<WarningBoardVO> getListWithPagin(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	// 댓글 수 증가하기
	public void updateReplyCnt(@Param("wa_num") int wa_num , @Param("amount") int amount);

}
