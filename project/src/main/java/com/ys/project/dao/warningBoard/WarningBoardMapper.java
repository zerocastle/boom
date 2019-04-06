package com.ys.project.dao.warningBoard;

import java.util.List;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.WarningBoardVO;

public interface WarningBoardMapper {

	public void insert(WarningBoardVO warningBoardVO);

	public WarningBoardVO read(long no_num);

	public int delete(long no_num);

	public int update(WarningBoardVO warningBoardVO);
	
	public List<WarningBoardVO> getListWithPagin(Criteria cri);
	
	public int getTotalCount(Criteria cri);

}
