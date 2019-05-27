package com.ys.project.service.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ys.project.dao.member.PartnerDao;
import com.ys.project.projectVO.AppPartnerVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PartnerVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PartnerService {

   private static final Logger logger = LoggerFactory.getLogger(PartnerService.class);
   @Autowired
   private PartnerDao dao;
   
   //����?�� �����?����?��
   public void partnerRegister(PartnerVO partner) {
      // TODO Auto-generated method stub
      dao.partnerRegister(partner);
   }
   
   public int selectnumber(String nickname) {
//      System.out.println("맴�? mnum ?��???? " + dao.selectnumber(nickname).toString());
      return dao.selectnumber(nickname);
   }
   
   public void partnerUpdate(MemberVO membervo) {
      logger.info("파트너 업데이트" + membervo);
      dao.partnerUpdate(membervo);
   }
   
   public List<PartnerVO> getList() {
      return dao.getList();
   }

   public int appUpdatePartner(AppPartnerVO vo) {
      // TODO Auto-generated method stub
      return dao.appUpdatePartner(vo);
   }

   public void appUpdateSignal(String nickname) {
      // TODO Auto-generated method stub
      dao.appUpdateSignal(nickname);
   }

   public MemberVO checkMember(String nickname) {
      // TODO Auto-generated method stub
      return dao.chechMember(nickname);
   }

}