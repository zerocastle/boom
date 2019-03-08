package org.ys.boarder.service;

import java.util.List;

import org.ys.boarder.domain.BoarderVO;

public interface IBoarderService {

	public void insertService(BoarderVO boarderVo);

	public List<BoarderVO> selectBoarderAllService(BoarderVO boarder);

}
