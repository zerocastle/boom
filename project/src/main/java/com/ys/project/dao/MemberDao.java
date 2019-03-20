package com.ys.project.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ys.project.memberVO.MemberVO;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class MemberDao implements IMemberDao {

	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	@Autowired
	private SqlSession session;

	@Override
	public void registerMember(Map map) throws Exception {
		// TODO Auto-generated method stub

		logger.info("레지스터 넘어온 값 : " + map.toString());
		session.insert("member.memberRegister", map);

	}

	@Override
	public MemberVO loginMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ㅇ날ㄴ아ㅣ러아ㅣㄴ러ㅣㅏㅇㄴ");
//		logger.info(session.selectOne("member.memberLogin", memberVO).toString());
		return session.selectOne("member.memberLogin", memberVO);
	}

}
