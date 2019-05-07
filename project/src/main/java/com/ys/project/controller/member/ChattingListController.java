package com.ys.project.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ys.project.projectVO.MemberVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "chatting")
public class ChattingListController {
	@Autowired
	private RedisTemplate< String , String > redisTemplate;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	//채팅 목록
	@RequestMapping(value = "chatting", method = RequestMethod.GET)
	public String chatGet(Model model, HttpSession session) {
		MemberVO user2 = (MemberVO) session.getAttribute("loginSession");
		String user = user2.getNickname();
		System.out.println(">>>>> redis test ");
		  try {
			 
			 redisTemplate.delete("user");//세션초기화
			 
		   System.out.println(">>>>> has : " + redisTemplate.hasKey("user"));// key 존재하면 TRUE 없으면FALSE 
		   redisTemplate.opsForValue().set("user", user);    // "user"라는 키값,user.name이라는 valuer값
		   String value = redisTemplate.opsForValue( ).get("user");   
		   
		   System.out.println(">>>>> redis value :" + value);
		logger.info("체팅 목록으로 이동");} 
		  catch(Exception ex) {
			   ex.printStackTrace();
			  } 
		return "chat/chatList";

	}
	
	// 직톡하기
	@RequestMapping(value = "doChat*", method = RequestMethod.GET)
	public String doChat(Model model, HttpSession session, HttpServletRequest request) {
		MemberVO user2 = (MemberVO) session.getAttribute("loginSession");
		String user = user2.getNickname();
		String m_num = request.getParameter("m_num");
		String pro_num = request.getParameter("pro_num");
		request.setAttribute("m_num", m_num);
		request.setAttribute("pro_num", pro_num);
		System.out.println(">>>>> redis test 회원번호" + m_num+" ++ 상품번호" + pro_num);
		  try {
			 
			 redisTemplate.delete("user");//세션초기화
			 
		   System.out.println(">>>>> has : " + redisTemplate.hasKey("user"));// key 존재하면 TRUE 없으면FALSE 
		   redisTemplate.opsForValue().set("user", user);    // "user"라는 키값,user.name이라는 valuer값
		   String value = redisTemplate.opsForValue().get("user");   
		   
		   System.out.println(">>>>> redis value :" + value);
		logger.info("클릭된 상품정보로 채팅방 생성하고 바로 채팅방입장");} 
		  catch(Exception ex) {
			   ex.printStackTrace();
			  } 
		//return "chat/moveChat?m_num="+m_num+"&pro_num="+pro_num;
		  return "chat/moveChat";
	}
	
	

}
