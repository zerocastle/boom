package com.ys.project.controller.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "chatting")
public class ChattingListController {
	@Autowired
	private RedisTemplate< String , String > redisTemplate;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "chatting", method = RequestMethod.GET)
	public String chatGet(Model model, HttpSession session) {
		String user = (String) session.getAttribute("loginSession");
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

}
