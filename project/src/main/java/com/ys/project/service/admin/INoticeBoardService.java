package com.ys.project.service.admin;

import java.util.List;

import com.ys.project.memberVO.Criteria;
import com.ys.project.memberVO.NoticeBoardVO;

public interface INoticeBoardService {

	public void register(NoticeBoardVO board);

	public NoticeBoardVO get(long bno);

	public boolean modify(NoticeBoardVO board);

	public boolean remove(long bno);

//	public List<NoticeBoard> getList();
	
	//∆‰¿Ã¬°
	public List<NoticeBoardVO> getList(Criteria cri);
	
	// ≈‰≈ª µÈ∞Ìø¿±‚
		public int getTotalCount();
	

}
