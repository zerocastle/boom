package com.ys.project.admin.mapper;

import java.util.List;

import com.ys.project.memberVO.Criteria;
import com.ys.project.memberVO.NoticeBoard;

public interface NoticeBoardMapper {
	public List<NoticeBoard> getList();
	
	public void insert(NoticeBoard board);

	public void insertSelectKey(NoticeBoard board);

	public NoticeBoard read(long bno);

	// 반환 값을 int로 처리하면 실행하면 1 , 아님 0이 출력된다.
	public int delete(long bno);

	public int update(NoticeBoard board);
	
	public List<NoticeBoard> getListWithPagin(Criteria cri);
	
	// 토탈 들고오기
	public int getTotalCount();
}
