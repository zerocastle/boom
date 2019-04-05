package com.ys.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.memberVO.MemberVO;
import com.ys.project.memberVO.PartnerVO;
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
	public String partnerRegisterPost(Model model, PartnerVO partner, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		HttpSession session = request.getSession();
		String loginSession = (String) session.getAttribute("loginSession"); // 로그인된 세션의 닉네임
		String tempPartner_signal_fuck = (String) session.getAttribute("partner_signal");// 로그인된 세션의 파트너신호(등록 직플레이스 갯수로
		int tempPartner_signal = Integer.parseInt(tempPartner_signal_fuck);
		int update_siganl = tempPartner_signal + 1; // update 했다

		logger.info("파트너 레지스터 :" + partner.toString());

		// Map partner 는 입력된 form태그의 값들.
//		logger.info("다음" + service.selectnumber(loginSession).toString());
		int m_num;
		m_num = service.selectnumber(loginSession); // 회원에 번호 들고올라고 서치
		logger.info("mNum : " + m_num);

		update_siganl = tempPartner_signal + 1; // 더해주고 넣어줄꺼

		session.removeAttribute(loginSession);
		session.removeAttribute(tempPartner_signal_fuck);

		partner.setM_num(m_num);
		logger.info("변해라 ~~~ 포린키" + partner);
		service.partnerRegister(partner);

		// 업데이트 넣어줄꺼 시발
		MemberVO member = new MemberVO();
		member.setPartner_signal(update_siganl);
		member.setNickname(loginSession);
		service.partnerUpdate(member);
		logger.info("member : " + member);
		// 업데이트 세션
		session.setAttribute("loginSession", loginSession);
		session.setAttribute("partner_signal", Integer.toString(update_siganl));

		return "redirect:/";// 파트너 가입이 완료되어 메인페이지 이동
	}

	// 검색 페이지 이동
	@SuppressWarnings("unchecked")

	@RequestMapping(value = "placeSearch", method = RequestMethod.GET)
	public String GetPartner(Model model) throws Exception {
		/* model.addAttribute("list" , service.getList()); */
		JSONArray array = new JSONArray();
		JSONObject object = null;


		PartnerVO partner;
		List<PartnerVO> partnerList = service.getList();

		int length = partnerList.size();
		for (int i = 0; i < length; i++) {
			object = new JSONObject();
			
			partner = partnerList.get(i);
			object.put("company_number", partner.getCompany_number());
			object.put("part_name", partner.getPart_name());
			object.put("boss_name", partner.getBoss_name());
			object.put("part_phone", partner.getPart_phone());
			object.put("zip_code", partner.getZip_code());
			object.put("road_name", partner.getRoad_name());
			object.put("addr", partner.getAddr());
			object.put("detail_addr", partner.getDetail_addr());
			object.put("reg_date", partner.getReg_date().toString());
			object.put("lag", partner.getLag());
			object.put("lng", partner.getLng());

			object.put("m_num", partner.getM_num());

			array.add(object);

			
		
		}
		
		logger.info("fuck : " + array.toString());
		/*
		 * object3 = new JSONObject(); object3.put("fucking",object2);
		 */
		model.addAttribute("list", array);
		logger.info("JSON으로 넘어온 LIST : " + array);
		System.out.println();
//			return "partner/placeSearch";

		return "/partner/placeSearch";
	}

//	@RequestMapping(value = "placeSearch", method = RequestMethod.GET)
//	public void placeSearch(Model model) throws Exception {
//
//		logger.info("직플레이스 검색 페이지  이동...");
//	}
	
	// 마이페이지 인포플레이스 페이지 이동
	@RequestMapping(value = "InfoPlace", method = RequestMethod.GET)
	public void InfoPlaceGet(Model model) throws Exception {

		logger.info("마이페이지 인포플레이스 이동...");
	}


}
