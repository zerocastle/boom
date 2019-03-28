package com.ys.project;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.service.PartnerService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "partner")
public class PartnerController {

	private static final Logger logger = LoggerFactory.getLogger(PartnerController.class);
	@Autowired
	private PartnerService service;

	// 파트너 페이지 이동
	@RequestMapping(value = "partnerPage", method = RequestMethod.GET)
	public void partnerRegisterGet(Model model) throws Exception {

		logger.info("파트너 레지스터 가입 이동...");
	}

	// 파트너 가입
	@RequestMapping(value = "partnerRegister", method = RequestMethod.POST)
	public String partnerRegisterPost(Model model, @RequestParam Map<String, Object> partner,
			HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		String loginSession = (String) session.getAttribute("loginSession"); // 로그인된 세션의 닉네임
		String partner_signal = (String) session.getAttribute("partner_signal");// 로그인된 세션의 파트너신호(등록 직플레이스 갯수로 정해짐)
		logger.info("파트너 레지스터 :" + partner.toString());
		// Map partner 는 입력된 form태그의 값들.
		logger.info("다음" + service.selectnumber(loginSession).toString());
		Map mvo = service.selectnumber(loginSession);
		logger.info(mvo.toString());
		int mnum = ((BigDecimal) mvo.get("M_NUM")).intValue();
//		int mnum = (int) mvo.get("M_NUM"); BigDecimal은 int로 타입캐스팅 할수없다는 에러발생
		logger.info("파트너 레지스터  번호검색:");
		logger.info("파트너 레지스터  VO에서 번호가져옴:" + mnum);
		// 닉네임으로 DB의 m_num을 찾아서 인서트할때 같이 넣어준다.
		logger.info("파트너 레지스터 :" + partner.toString() + partner_signal);
		service.partnerRegister(partner, mnum);
		logger.info("파트너 삽입 완료");
		
		rttr.addFlashAttribute("msg", "SUCCESSPARTNER");

		service.partnersignalup(mnum);
		logger.info("파트너 업데이트 완료");

		
		session.removeAttribute("partner_signal");
		logger.info("세션의 partner_signal 정보를 날렸다!");
		// 세션에 DB의 업데이트된 값을 불러옴과 동시에
		Map mvo2 = service.selectnumber(loginSession); // 업데이트된 정보를 찾는다.
		logger.info("업데이트이후의 정보를 찾는다" + mvo2.get("NICKNAME") + " /// " + mvo2.get("PARTNER_SIGNAL"));
		
		
		session.setAttribute("partner_signal", mvo2.get("PARTNER_SIGNAL"));
		logger.info("세션의 partner_signal어트리뷰트 값을 넣주고 직플파트너 등록 작업완료");

		return "redirect:/";// 파트너 가입이 완료되어 메인페이지 이동
	}

}
