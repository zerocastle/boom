package com.ys.project.app.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.projectVO.AppPartnerVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.service.member.PartnerService;
import com.ys.project.service.production.IProductionService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

@RestController
@AllArgsConstructor
@RequestMapping(value = "/app/partner/**")
public class AppPartherController {


   private PartnerService service;

   @CrossOrigin(origins = "*", maxAge = 3600)
   @PostMapping(value = "/partnerRegister")
   public MemberVO appPartnerRegister(@RequestBody AppPartnerVO vo) {

      System.out.println("AppPartner vo : "+vo);
      int m_num = service.selectnumber(vo.getNickname());
      vo.setM_num(m_num);
      
      System.out.println("재차 확인 AppPartner vo : "+vo);
      int check = service.appUpdatePartner(vo);
      if(check == 1) {
         service.appUpdateSignal(vo.getNickname());
         MemberVO member = service.checkMember(vo.getNickname());
         return member;
      }else {
         MemberVO member = service.checkMember(vo.getNickname());
         return member;
      }
   }

}