package com.ys.project.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;

@Repository
@AllArgsConstructor
public class PartnerDao {
	private static final Logger logger = LoggerFactory.getLogger(PartnerDao.class);

	@Autowired
	private SqlSession session;
	
	public void partnerRegister(Map<String, Object> partner, int mnum) {
		// TODO Auto-generated method stub
	
		logger.info("파트너 DAO: Map 객체  :" + partner.toString());
		logger.info("파트너 DAO: 삽입 Mnum :" + mnum);
		partner.put("m_num", mnum);
		logger.info((String) partner.get("p_start"));
		String a = "2000-01-01 "+(String)partner.get("p_start") + ":00";
		String b = "2000-01-01 "+(String)partner.get("p_end") + ":00";
		partner.put("p_start", a);
		partner.put("p_end", b);
		logger.info("파트너 DAO: 다넣었다!" + partner.toString());
		// 파트너mapper 객체에 mnum 변수값을 어떻게 대입할까
		session.insert("partner.partnerRegister", partner); // 파트너 인서트
		logger.info("파트너 DAO: 인서트완료 " + partner.toString());
		
		
		
		
	}
	
	public Map selectnumber(String nickname) {
		logger.info("닉네임 찾기 : " + nickname);
		return session.selectOne("partner.selectnumber", nickname);
	}
	
	public void partnerSignalUp(int mnum) {
		logger.info("(DAO)업데이트할 mnum : "+mnum);
		session.update("partner.partnersignalup", mnum);
		// 에러발생 ### Cause: java.sql.SQLSyntaxErrorException: ORA-00911: 문자가 부적합합니다 update member set partner_signal = partner_signal + 1 where m_num = ?
		// update member set partner_signal = partner_signal + 1 where m_num = ? 이라는데 ?를 숫자로 대체해서 OracleDeveloper에서 이상없이 적용됨.
		// 
		logger.info("(DAO)세션 업데이트 메소드 완료 ");
	}
	
}
