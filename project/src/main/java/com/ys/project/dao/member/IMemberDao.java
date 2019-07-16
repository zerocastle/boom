package com.ys.project.dao.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.PaymentVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.projectVO.joinProductVO;
import com.ys.project.projectVO.joinReviewVO;

public interface IMemberDao {
	
	//ȸ�� ����
	public void registerMember(Map map) throws Exception;
	
	//�α���
	public MemberVO loginMember(MemberVO memberVO) throws Exception;
	
	//�г���üũ
	public MemberVO memberCheck(String nickName) throws Exception;
	
	//ȸ�� Ż��
	public void memberDelete(String nickname) throws Exception;

	//ȸ������
	public void memberUpdate(MemberVO vo) throws Exception;

	//�����ı� ������
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

	public List<PaymentVO> getMemberPayment(String nickName) throws Exception;

	public int insertRegister(MemberVO vo) throws Exception;

	public int checkNick(MemberVO vo) throws Exception;

	public List<PartnerVO> getPlaceList(int m_num);

	public List<HashMap<String, String>> getInProdList(String part_name);

	public PartnerVO partnerManage(String data);

	public void partnerUpdate(PartnerVO vo);

	public void partnerDelete(String string);

	public void partnerProdelete(String aa);

}
