package com.ys.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ys.project.dao.PartnerDao;
import com.ys.project.memberVO.MemberVO;
import com.ys.project.memberVO.PartnerVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PartnerService {

	private static final Logger logger = LoggerFactory.getLogger(PartnerService.class);
	@Autowired
	private PartnerDao dao;
	
	//���몃�� ����吏���由�
	public void partnerRegister(PartnerVO partner) {
		// TODO Auto-generated method stub
		dao.partnerRegister(partner);
	}
	
	public int selectnumber(String nickname) {
//		System.out.println("맴버 mnum 들고옴? " + dao.selectnumber(nickname).toString());
		return dao.selectnumber(nickname);
	}
	
	public void partnerUpdate(MemberVO membervo) {
		logger.info("업데이트 넘버 서비스" + membervo);
		dao.partnerUpdate(membervo);
	}
	
	public List<PartnerVO> getList() {
		return dao.getList();
	}

}
