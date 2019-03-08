package org.ys.boarder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.ys.boarder.domain.BoarderVO;

@Repository
public class BoarderDao implements IBoarderDao {
	
	@Autowired
	SqlSession session;
	@Override
	public void insertDao(BoarderVO boarderVo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoarderVO> selectBoarderAllDao(BoarderVO boarder) {
		// TODO Auto-generated method stub
		return null;
	}

}
