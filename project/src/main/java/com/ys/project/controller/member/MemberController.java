package com.ys.project.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectVO.MemberVO;
import com.ys.project.service.member.IMemberService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private IMemberService service;

	// 로그인 처리
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model, @RequestParam Map map) throws Exception {

		return "login/login";

	}

	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPost(Model model, @RequestBody MemberVO vo, HttpServletRequest request) throws Exception {
		logger.info("===================================================> loginPost 넘오온 값 : " + vo.toString());
		System.out.println("뭐가 넘어 왔냐 ? " + vo);

		HttpSession session = request.getSession();
		
		JSONObject object = new JSONObject();
		vo = service.loginMember(vo);
		if (vo != null) {
			session.setAttribute("loginSession", vo);
			object.put("signal", "success");
			object.put("nickname",vo.getNickname());
			return object.toString();
		} else {
			System.out.println("========================띠발띠발 띠발========");
			object.put("signal","fail");
			return object.toString();
		}

	}

	// 로그아웃
	@RequestMapping("logout")
	public String memberLogout(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	// 회원 가입

	@RequestMapping(value = "memberRegister", method = RequestMethod.GET)
	public String memberRegister(Model model) throws Exception {

		return "login/memberRegister";

	}

	@RequestMapping(value = "memberRegister", method = RequestMethod.POST)
	public String memberRegisterPost(Model model, @RequestParam Map map, RedirectAttributes ra) throws Exception {
		logger.info("맴버 레지스터 : " + map);
		ra.addFlashAttribute("msg", "SUCCESS");
		service.registerMember(map);
		return "redirect:/";

	}

	// 닉네임 체크
	@RequestMapping(value = "nickNameCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> nickNameCheck(Model model, @RequestBody MemberVO nickName, RedirectAttributes ra)
			throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		logger.info("닉네임 체크 : " + nickName);
		nickName = service.nickNameCheck(nickName.getNickname());
		if (nickName == null) {
			map.put("signal", "SUCCESS");
		} else
			map.put("signal", "fail");
		return map;

	}

	// 마이페이지 , // 해당 세션의 닉네임 정보 조회
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // 로그인된 세션의 닉네임
		System.out.println("러나ㅣ어리ㅏㄴㅇ" + session.getAttribute("loginSession"));
		logger.info("현재 세션의 정보 : " + member);

		model.addAttribute("member", member);

		System.out.println("마이 페이지 : member/myPage");

		return "myPage/myPage";
	}

	
	// post 데이터 수정 
	@RequestMapping(value = "myPage", method = RequestMethod.POST)
	@ResponseBody
	public MemberVO memberUpdate(Model model, @RequestBody MemberVO vo, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO before = (MemberVO) session.getAttribute("loginSession"); // 로그인된 세션의 닉네임

		System.out.println("업데이트 되기전 : " + before);

		service.memberUpdate(vo);
		System.out.println("업데이트 된후 : " + vo);

		session.setAttribute("loginSession", vo);

		return vo;
	}
	
	// 타인 페이지
	@RequestMapping(value = "other/"+"{data}", method = RequestMethod.GET)
	public String otherGET(Model model , @PathVariable String data) throws Exception {
		
		MemberVO member = service.nickNameCheck(data);

		model.addAttribute("other",member);
		 
		return "/myPage/other"; 

	}

	@CrossOrigin(maxAge = 3600)
	   @ResponseBody
	   @RequestMapping(value = "mlogin", method = RequestMethod.POST)
	   public String mlogin(Model model, @RequestBody Map<String, String> map) throws Exception {
	      //JSONParser parser;
	      //parser=new JSONParser();
//	      Object a =parser.parse(param);
//	      JSONObject jsonobj=(JSONObject) a;
//	      String nickname=(String)jsonobj.get("nickname");
//	      String m_password=(String)jsonobj.get("m_password");
		
		
//	      System.out.println(nickname + m_password);
//	      System.out.println("mlogin");
	      // Map<String, String> map = new HashMap<String, String>();
	      //JSONObject hh = (JSONObject) parser.parse(param);
	      //logger.info("닉네임 : " + param);
		logger.info("닉네임 : sdsdddddddddddddddddddddddddddddddddddddddddddd" + map);
	      String name = (String) map.get("nickname");
	      MemberVO member = service.nickNameCheck(name);
	      logger.info("닉네임 : sdsdddddddddddddddddddddddddddddddddddddddddddd" + member);
	      /*
	       * if (nickName == null) { map.put("signal", "SUCCESS"); } else
	       * map.put("signal", "fail");
	       */
	      return "ok";
	   }
	
	

}
