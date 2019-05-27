package com.ys.project.service.admin;

import java.util.List;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.NoticeBoardVO;
import com.ys.project.projectVO.UserListVO;
import com.ys.project.projectVO.buyListVO;

public interface INoticeBoardService {

	public void register(NoticeBoardVO board);

	public NoticeBoardVO get(long bno);

	public boolean modify(NoticeBoardVO board);

	public boolean remove(long bno);

//	public List<NoticeBoard> getList();
	
	//∆‰¿Ã¬°
	public List<NoticeBoardVO> getList(Criteria cri);
	
	public List<buyListVO> buy();
    
    public List<UserListVO> User();

	public int getTotalCount();

}
