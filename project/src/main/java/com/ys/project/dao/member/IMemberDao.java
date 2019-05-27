package com.ys.project.dao.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.projectVO.joinProductVO;
import com.ys.project.projectVO.joinReviewVO;

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

	public int appMemberUpdate(MemberVO vo) throws Exception;

	List<MemberVO> AppMemberCheck(String nickName) throws Exception;

	public void insertPick(LikeListVO vo) throws Exception;

	public int searchPick(LikeListVO vo) throws Exception;

	public int totalPick(int num) throws Exception;

	public List<joinPickVO> joinPickPaging(joinPickVO pv) throws Exception;

	public List<joinPickVO> myPageList(joinPickVO pv) throws Exception;

	public int myPageListCount(int num) throws Exception;

	public List<joinPickVO> joinPick(int m_num) throws Exception;
	
	public void deletePick(LikeListVO vo) throws Exception;

	public int getPickCount(LikeListVO vo) throws Exception;

	public List<joinReviewVO> appReview(int num) throws Exception;

	public List<joinProductVO> appOtherProduct(int m_num) throws Exception;

	public List<ProductionReviewVO> appOtherReview(int m_num) throws Exception;

	public int appReviewCount(int m_num) throws Exception;

	public List<joinProductVO> appProduct(int m_num) throws Exception;

	public void appProductDelete(LikeListVO vo) throws Exception;
}
