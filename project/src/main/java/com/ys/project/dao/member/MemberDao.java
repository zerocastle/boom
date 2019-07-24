package com.ys.project.dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.NoticeBoardVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.PaymentVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.WarningBoardReplyVO;
import com.ys.project.projectVO.WarningBoardVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.projectVO.joinProductVO;
import com.ys.project.projectVO.joinReviewVO;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class MemberDao implements IMemberDao {

	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	@Autowired
	private SqlSession session;

	//ȸ�� ���� map ó��
	@Override
	public void registerMember(Map map) throws Exception {
		// TODO Auto-generated method stub

		logger.info("�������� dao: " + map.toString());
		session.insert("member.memberRegister", map);

	}

	@Override
	public MemberVO loginMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("�������Ƥӷ��ƤӤ����Ӥ�����");
//		logger.info(session.selectOne("member.memberLogin", memberVO).toString());
		return session.selectOne("member.memberLogin", memberVO);
	}

	@Override
	public MemberVO memberCheck(String nickName) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("�ɹ� üũ" + nickName);
		System.out.println("oo : " + session.selectOne("nicknameCheck", nickName));
		return session.selectOne("member.nicknameCheck", nickName);
	}

	@Override
	public void memberDelete(String nickname) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ȸ�� Ż�� ");
		session.delete("member.memberDelete",nickname);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ȸ������");
		session.insert("member.memberUpdate",vo);
	}

	@Override
	public List<ProductionReviewVO> getReviewData(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("��ǰ����������");
		return session.selectList("member.getShopReview", member);
	}

	@Override
	public List<ProductionReviewVO> getReviewData2(String data) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.getShopReview2",data);
	}

	@Override
	public int getPagingListCount(int i) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.pagingListCount",i);
	}

	@Override
	public List<ProductionReviewVO> getPagingList(ProductionReviewVO pv) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.pagingReivewList", pv);
	}

	@Override
	public List<ProductionReviewVO> scrollPaging(String nickname) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.scrollPaging",nickname);
	}

	@Override
	public List<ProductionReviewVO> infiniteScrollDown(Map map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.infiniteScrollDown",map);
	}

	@Override
	public int usingData(String data) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.usingData",data);
	}

	@Override
	public List<MemberVO> AppMemberCheck(String nickName) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.nicknameCheck",nickName);
	}

	@Override
	public int appMemberUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("member.appMemberUpdate",vo);
	}
	
	@Override
	public void insertPick(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert("member.insertPick",vo);
	}

	@Override
	public int searchPick(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchPick",vo);
	}

	@Override
	public int totalPick(int num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.totalPick",num);
	}

	@Override
	public List<joinPickVO> joinPickPaging(joinPickVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.joinPickPaging",vo);
	}

	@Override
	public List<joinPickVO> myPageList(joinPickVO pv) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.myPageList",pv);
	}

	@Override
	public int myPageListCount(int num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.myPageListCount", num);
	}

	@Override
	public List<joinPickVO> joinPick(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.joinPick",m_num);
	}

	@Override
	public void deletePick(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.delete("member.deletePick",vo);
	}

	@Override
	public int getPickCount(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.getPickCount", vo);
	}

	@Override
	public List<joinReviewVO> appReview(int num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.appReview",num);
	}

	@Override
	public List<joinProductVO> appOtherProduct(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.appOtherProduct",m_num);
	}

	@Override
	public List<ProductionReviewVO> appOtherReview(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.appOtherReview",m_num);
	}

	@Override
	public int appReviewCount(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.appReviewCount",m_num);
	}

	@Override
	public List<joinProductVO> appProduct(int m_num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.appProduct",m_num);
	}

	@Override
	public void appProductDelete(LikeListVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.delete("member.appProductDelete",vo);
	}

	@Override
	public List<PaymentVO> getMemberPayment(String nickName) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("member.getMemberPayment",nickName);
	}

	@Override
	public int insertRegister(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("member.insertRegister",vo);
	}

	@Override
	public int checkNick(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkNick",vo);
	}

	@Override
	public List<PartnerVO> getPlaceList(int m_num) {
		// TODO Auto-generated method stub
		return session.selectList("member.getPlaceList",m_num);
	}

	@Override
	public List<HashMap<String, String>> getInProdList(String part_name) {
		// TODO Auto-generated method stub
		return session.selectList("member.getInProdList", part_name);
	}

	@Override
	public PartnerVO partnerManage(String data) {
		// TODO Auto-generated method stub
		return session.selectOne("member.partnerManage", data);
	}

	@Override
	public void partnerUpdate(PartnerVO vo) {
		
		session.update("member.partnerUpdate", vo);
	}

	@Override
	public void partnerDelete(String company_number) {
		// TODO Auto-generated method stub
		
		session.delete("member.partnerDelete", company_number);
	}

	@Override
	public void partnerProdelete(String aa) {
		// TODO Auto-generated method stub
		session.delete("member.productDelete", aa);
	}

	@Override
	public List<NoticeBoardVO>appNoticeBoard() {
		// TODO Auto-generated method stub
		return session.selectList("member.noticeboard");
	}

	@Override
	public NoticeBoardVO appNoticeList(String no_num) {
		// TODO Auto-generated method stub
		
		int a = Integer.parseInt(no_num);
		return session.selectOne("member.noticelist", a);
	}

	@Override
	public List<WarningBoardVO> appWarningBoard() {
		// TODO Auto-generated method stub
		return session.selectList("member.warningboard");
	}

	@Override
	public WarningBoardVO appWarningList(String wa_num) {
		// TODO Auto-generated method stub
		return session.selectOne("member.warninglist", wa_num);
	}

	@Override
	public void appWarningReply(WarningBoardReplyVO vo) {
		// TODO Auto-generated method stub
		session.insert("member.warningreply", vo);
	}

}
