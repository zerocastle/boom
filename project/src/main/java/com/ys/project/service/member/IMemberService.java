package com.ys.project.service.member;

import java.util.List;
import java.util.Map;

import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.ProductionReviewVO;

public interface IMemberService {
	
	public void registerMember(Map map) throws Exception;

	public MemberVO loginMember(MemberVO memberVO) throws Exception;
	
	public MemberVO nickNameCheck(String nickName) throws Exception;

	public void memberUpdate(MemberVO vo) throws Exception;

	public List<ProductionReviewVO> getReivewData(MemberVO member) throws Exception;

	public List<ProductionReviewVO> getReivewData2(String data) throws Exception;

	public List<ProductionReviewVO> getPagingList(ProductionReviewVO pv) throws Exception;

	int getPagingListCount(int i) throws Exception;

	public List<ProductionReviewVO> scrollPaging(String nickname) throws Exception;

	public List<ProductionReviewVO> infiniteScrollDown(Map map) throws Exception;

	public int usingData(String data) throws Exception;

}
