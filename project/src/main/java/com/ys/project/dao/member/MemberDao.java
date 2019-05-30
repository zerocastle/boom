package com.ys.project.dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionReviewVO;
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

	//회원 가입 map 처리
	@Override
	public void registerMember(Map map) throws Exception {
		// TODO Auto-generated method stub

		logger.info("레지스터 dao: " + map.toString());
		session.insert("member.memberRegister", map);

	}

	@Override
	public MemberVO loginMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ㅇ날ㄴ아ㅣ러아ㅣㄴ러ㅣㅏㅇㄴ");
//		logger.info(session.selectOne("member.memberLogin", memberVO).toString());
		return session.selectOne("member.memberLogin", memberVO);
	}

	@Override
	public MemberVO memberCheck(String nickName) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("맴버 체크" + nickName);
		System.out.println("oo : " + session.selectOne("nicknameCheck", nickName));
		return session.selectOne("member.nicknameCheck", nickName);
	}

	@Override
	public void memberDelete(String nickname) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("회원 탈퇴 ");
		session.delete("member.memberDelete",nickname);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("회원수정");
		session.insert("member.memberUpdate",vo);
	}

	@Override
	public List<ProductionReviewVO> getReviewData(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("상품정보데이터");
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
}
