package com.ys.project.dao.warningBoard;

import com.ys.project.projectVO.WarningBoardVO;

public interface WarningBoardMapper {

	public void insert(WarningBoardVO warningBoardVO);

	public WarningBoardVO read(long bno);

}
