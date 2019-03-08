package org.ys.boarder.dao;

import java.util.List;

import org.ys.boarder.domain.BoarderVO;

public interface IBoarderDao {

	public void insertDao(BoarderVO boarderVo);

	public List<BoarderVO> selectBoarderAllDao(BoarderVO boarder);

}
