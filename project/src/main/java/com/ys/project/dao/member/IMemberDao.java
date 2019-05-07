package com.ys.project.dao.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.ProductionReviewVO;

public interface IMemberDao {
	
	//회원 가입
	public void registerMember(Map map) throws Exception;
	
	//로그인
	public MemberVO loginMember(MemberVO memberVO) throws Exception;
	
	//닉네임체크
	public MemberVO memberCheck(String nickName) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(String nickname) throws Exception;

	//회원수정
	public void memberUpdate(MemberVO vo) throws Exception;

	//상점후기 데이터
	public List<ProductionReviewVO> getReviewData(MemberVO member) throws Exception;

	public List<ProductionReviewVO> getReviewData2(String data) throws Exception;

	public List<ProductionReviewVO> getPagingList(ProductionReviewVO pv) throws Exception;

	public List<ProductionReviewVO> scrollPaging(String nickname) throws Exception;

	public List<ProductionReviewVO> infiniteScrollDown(Map map) throws Exception;

	int getPagingListCount(int i) throws Exception;

	public int usingData(String data) throws Exception;
}
