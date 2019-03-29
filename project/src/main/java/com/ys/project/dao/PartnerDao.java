package com.ys.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.ys.project.memberVO.MemberVO;
import com.ys.project.memberVO.Partner;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class PartnerDao {
	private static final Logger logger = LoggerFactory.getLogger(PartnerDao.class);

	@Autowired
	private SqlSession session;

	public void partnerRegister(Partner partner) {
		// TODO Auto-generated method stub
		logger.info("디에이오 파트너 " + partner);
//		partner.setLag("123.456");
//		partner.setLng("456.789");
		// 파트너mapper 객체에 mnum 변수값을 어떻게 대입할까
		session.insert("partner.partnerRegister", partner); // 파트너 인서트

	}

	public int selectnumber(@RequestParam String nickname) {
		logger.info("닉네임 찾기 : " + nickname);
		return session.selectOne("partner.selectnumber", nickname);
	}
	
	public void partnerUpdate(MemberVO memervo) {
		session.update("partner.updateNumber",memervo);
	}


}
