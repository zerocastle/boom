package com.ys.project.dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionReviewVO;

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
}
