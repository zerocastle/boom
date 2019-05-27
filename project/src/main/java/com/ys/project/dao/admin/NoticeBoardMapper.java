package com.ys.project.dao.admin;

import java.util.List;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.NoticeBoardVO;
import com.ys.project.projectVO.UserListVO;
import com.ys.project.projectVO.buyListVO;


public interface NoticeBoardMapper {
	public List<NoticeBoardVO> getList();
	
	public void insert(NoticeBoardVO board);

	public void insertSelectKey(NoticeBoardVO board);

	public NoticeBoardVO read(long bno);

	// ��ȯ ���� int�� ó���ϸ� �����ϸ� 1 , �ƴ� 0�� ��µȴ�.
	public int delete(long bno);

	public int update(NoticeBoardVO board);
	
	// �˻� ������ ������ �׳� ����¡ ó�� 
	public List<NoticeBoardVO> getlistWithPagin(Criteria cri);
	
	// ��Ż ������
	public int getTotalCount();

	public List<buyListVO> buy();
   
	public List<UserListVO> User();
}
