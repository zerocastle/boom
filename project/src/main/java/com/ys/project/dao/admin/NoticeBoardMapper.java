package com.ys.project.dao.admin;

import java.util.List;

import com.ys.project.memberVO.Criteria;
import com.ys.project.memberVO.NoticeBoardVO;

public interface NoticeBoardMapper {
	public List<NoticeBoardVO> getList();
	
	public void insert(NoticeBoardVO board);

	public void insertSelectKey(NoticeBoardVO board);

	public NoticeBoardVO read(long bno);

	// 반환 값을 int로 처리하면 실행하면 1 , 아님 0이 출력된다.
	public int delete(long bno);

	public int update(NoticeBoardVO board);
	
	// 검색 조건이 없으면 그냥 페이징 처리 
	public List<NoticeBoardVO> getlistWithPagin(Criteria cri);
	
	// 토탈 들고오기
	public int getTotalCount();
}
