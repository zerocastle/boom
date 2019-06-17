package com.ys.project.app.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ys.project.projectVO.MemberVO;
import com.ys.project.service.member.IMemberService;

import lombok.AllArgsConstructor;

@Controller // 이건 Controller다..임을 알려주는 것 ㅋㅋㅋ
@AllArgsConstructor // 모든 필드(전역변수)를 파라미터로 가지는 생성자를 만든다. 간단하게 말해서 여기서 호출하는 클래스에 대한 생성자(Service)를 자동으로
					// 만든다
@RequestMapping(value = "/app/**") // /app/**로 오는 데이터 접근은 여기서 처리한다.
public class AppController { // 메인 클래스

	private static final Logger logger = LoggerFactory.getLogger(AppController.class); // 콘솔 찍어주는 것 지속적으로 logger로 상황보고
																						// 해주는 것
	@Autowired // AllArgsConstructor가 생성자를 만들 타겟 지정 -> Autowired는
	private IMemberService service; // DB제어를 하는 DAO에 접근하기 위한 service객체

	// 앱 로그인 페이지
	@CrossOrigin(maxAge = 3600)
	@ResponseBody // POST방식으로 오는 데이터들을 처리하기 위한 어노테이션
	@RequestMapping(value = "/mlogin", method = RequestMethod.POST) // POST형태이며 /mlogin<<-이 경로로 넘어오는 데이터들을 맵핑
	public Map mlogin(Model model, @RequestBody Map<String, String> map, HttpServletRequest request) throws Exception {
		// 위에꺼 Model = 기존의 만들어논 객체의 이름과 넘어오는 데이터의 이름이 같으면 자동적으로 맵핑��
		// 넘어오는 데이터를 Map클래스의 map<key,value> 형태로 데이터변환이 되어 받아온다.
		logger.info("닉네임 : sdsdddddddddddddddddddddddddddddddddddddddddddd" + map); // 찍어주는것(확인)
		String name = (String) map.get("nickname"); // name이라는 String변수를 만들어
		// map객체의 nickname이라는 key에 해당하는 value데이터를 String형으로 변환하여 넣는다.
		HttpSession session = request.getSession();

		String m_password = (String) map.get("m_password");
		MemberVO vo = new MemberVO();

		vo.setNickname(name);
		vo.setM_password(m_password);

		MemberVO member = service.loginMember(vo);// 실행순서 1.Controller 2.service 3.DAO
													// 4.memberMapper.xml(SqlSession/mybatis)
		// member객체를 만들어 memberMapper.xml파일 중 mapping되는 쿼리문을 실행(매개변수,결과객체는 지정한 형태로!)
		logger.info("닉네임 : sdsdddddddddddddddddddddddddddddddddddddddddddd" + member);// 찍어주는것(확인)
		if (member == null) {
			map.put("signal", "fail");
		} else {
			session.setAttribute("loginSession", member);
			MemberVO jj = (MemberVO) session.getAttribute("loginSession");
			logger.info(jj.toString());
			map.put("signal", "success");
			JSONObject amap = new JSONObject();

			amap.put("m_num", jj.getM_num() + "");
			amap.put("nickname", jj.getNickname() + "");
			amap.put("phone", jj.getPhone() + "");
			amap.put("m_password", jj.getM_password() + "");
			amap.put("email", jj.getEmail() + "");
			amap.put("manner", jj.getManner() + "");
			amap.put("intro", jj.getIntro() + "");
			amap.put("warning", jj.getWarning() + "");
			amap.put("img_path", jj.getImg_path() + "");
			amap.put("partner_nignal", jj.getPartner_signal() + "");
			amap.put("acc_num", jj.getAcc_num() + "");
			amap.put("acc_name", jj.getAcc_name() + "");

			String str = amap.toJSONString();
			map.put("json", str);
		}
		/*
		 * if (nickName == null) { map.put("signal", "SUCCESS"); } else
		 * map.put("signal", "fail");
		 */
		return map;
	}

//		@CrossOrigin(maxAge = 3600)
//	    @ResponseBody
//		@RequestMapping(value = "memberRegister", method = RequestMethod.GET)
//		public String memberRegister(Model model) throws Exception {
//
//			return "login/memberRegister";
//
//		}
	// 앱 회원 가입
	@CrossOrigin(maxAge = 3600)
	@ResponseBody
	@RequestMapping(value = "mregister", method = RequestMethod.POST)
	public String memberRegister(Model model, @RequestBody Map<String, String> map) throws Exception {

		logger.info("맴버 레지스터 : " + map);
		service.registerMember(map);
		return "success";

	}

	// 앱 닉네임 체크
	@CrossOrigin(maxAge = 3600)
	@RequestMapping(value = "mnickNameCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> nickNameCheck(Model model, @RequestBody Map<String, String> map) throws Exception {
		MemberVO member = new MemberVO();
		try {
			logger.info("닉네임 체크 : " + map);
			member = service.nickNameCheck(map.get("nickname"));
			logger.info(
					member.getNickname() + "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
			String nick = member.getNickname();

			map.put("signal", "nonuse");

		} catch (Exception e) {
			logger.info("�N");
			map.put("signal", "use");
		}
		return map;

	}

}
