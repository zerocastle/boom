package com.ys.project.service.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ys.project.dao.member.IMemberDao;
import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.NoticeBoardVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.PaymentVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.WarningBoardReplyVO;
import com.ys.project.projectVO.WarningBoardVO;
import com.ys.project.projectVO.ProductionVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.projectVO.joinProductVO;
import com.ys.project.projectVO.joinReviewVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao dao;

	@Override
	public void registerMember(Map map) throws Exception {
		dao.registerMember(map);
	}

	@Override
	public MemberVO loginMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("�������Ƥӷ��ƤӤ����Ӥ�����");
		return dao.loginMember(memberVO);
	}

	@Override
	public MemberVO nickNameCheck(String nickName) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("�г��� Ȯ�� : " + nickName);

		return dao.memberCheck(nickName);
	}
	
	@Override
	public List<MemberVO> appNickNameCheck(String nickName) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("�г��� Ȯ�� : " + nickName);

		return dao.AppMemberCheck(nickName);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.memberUpdate(vo);
	}

	@Override
	public List<ProductionReviewVO> getReivewData(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return dao.getReviewData(member);
	}

	@Override
	public List<ProductionReviewVO> getReivewData2(String data) throws Exception {
		// TODO Auto-generated method stub
		return dao.getReviewData2(data);
	}

	@Override
	public int getPagingListCount(int i) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPagingListCount(i);
	}

	@Override
	public List<ProductionReviewVO> getPagingList(ProductionReviewVO pv) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPagingList(pv);
	}

	@Override
	public List<ProductionReviewVO> scrollPaging(String nickname) throws Exception {
		// TODO Auto-generated method stub
			return dao.scrollPaging(nickname);
	}

	@Override
	public List<ProductionReviewVO> infiniteScrollDown(Map map) throws Exception {
		// TODO Auto-generated method stub
		return dao.infiniteScrollDown(map);
	}

	@Override
	public int usingData(String data) throws Exception {
		// TODO Auto-generated method stub
		return dao.usingData(data);
	}

	@Override
	public int appMemberUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.appMemberUpdate(vo);
	}
	@Override
	public void insertPick(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertPick(vo);
	}

	@Override
	public int searchPick(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchPick(vo);
	}

	@Override
	public int totalPick(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.totalPick(num);
	}

	@Override
	public List<joinPickVO> joinPickPaging(joinPickVO pv) throws Exception {
		// TODO Auto-generated method stub
		return dao.joinPickPaging(pv);
	}

	@Override
	public List<joinPickVO> myPageList(joinPickVO pv) throws Exception {
		// TODO Auto-generated method stub
		return dao.myPageList(pv);
	}

	@Override
	public int myPageListCount(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.myPageListCount(num);
	}

	@Override
	public List<joinPickVO> joinPick(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.joinPick(m_num);
	}

	@Override
	public void deletePick(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deletePick(vo);
	}

	@Override
	public void InsertPick(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertPick(vo);
	}

	@Override
	public int getPickCount(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPickCount(vo);
	}

	@Override
	public List<joinReviewVO> appReview(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.appReview(num);
	}

	@Override
	public List<joinProductVO> appOtherProduct(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.appOtherProduct(m_num);
	}

	@Override
	public List<ProductionReviewVO> appOtherReview(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.appOtherReview(m_num);
	}

	@Override
	public int appReviewCount(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.appReviewCount(m_num);
	}

	@Override
	public List<joinProductVO> appProduct(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.appProduct(m_num);
	}

	@Override
	public void appProductDelete(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.appProductDelete(vo);
	}

	@Override
	public List<PaymentVO> getMemberPayment(String nickName) throws Exception {
		// TODO Auto-generated method stub
		return dao.getMemberPayment(nickName);
	}

	@Override
	public int insertRegister(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertRegister(vo);
	}

	@Override
	public int checkNick(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkNick(vo);
	}

	@Override
	public List<PartnerVO> getPlaceList(int m_num) {
		// TODO Auto-generated method stub
		return dao.getPlaceList(m_num);
	}

	@Override
	public List<HashMap<String, String>> getInProdList(String part_name) {
		// TODO Auto-generated method stub
		return dao.getInProdList(part_name);
	}

	@Override
	public PartnerVO partnerManage(String data) {
		// TODO Auto-generated method stub
		return dao.partnerManage(data);
	}

	@Override
	public void partnerUpdate(PartnerVO vo) {
		// TODO Auto-generated method stub
		dao.partnerUpdate(vo);
	}

	@Override
	public void partnerDelete(String string) {
		// TODO Auto-generated method stub
		dao.partnerDelete(string);
	}

	@Override
	public void partnerProdelete(String aa) {
		// TODO Auto-generated method stub
		dao.partnerProdelete(aa);
	}

	@Override
	public List<NoticeBoardVO> appNoticeBoard() {
		// TODO Auto-generated method stub
		return dao.appNoticeBoard();
	}

	@Override
	public NoticeBoardVO appNoticeList(String no_num) {
		// TODO Auto-generated method stub
		return dao.appNoticeList(no_num);
	}

	@Override
	public List<WarningBoardVO> appWarningBoard() {
		// TODO Auto-generated method stub
		return dao.appWarningBoard();
	}

	@Override
	public WarningBoardVO appWarningList(String wa_num) {
		// TODO Auto-generated method stub
		return dao.appWarningList(wa_num);
	}

	@Override
	public void appWarningReply(WarningBoardReplyVO vo) {
		// TODO Auto-generated method stub
		dao.appWarningReply(vo);
	}


	
	//�ü����� �������
	@Override
	public List<ProductionVO> getMarketPrice() {
		// TODO Auto-generated method stub
		return null;
	}
}
