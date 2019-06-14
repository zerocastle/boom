package com.ys.project.controller.member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.service.member.PartnerService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/partner/**")
public class PartnerController {

	private static final Logger logger = LoggerFactory.getLogger(PartnerController.class);
	@Autowired
	private PartnerService service;

	// 파트너 페이지 이동
	@RequestMapping(value = "partnerPage", method = RequestMethod.GET)
	public void partnerRegisterGet(Model model) throws Exception {

		logger.info("파트너 레지스터 가입 이동...");
	}
	 @RequestMapping(value = "/partnerRegister", method = RequestMethod.POST)
	   public String partnerRegisterPost(Model model, PartnerVO partner, HttpServletRequest request,
	         RedirectAttributes rttr, @RequestParam("uploadFile") MultipartFile[] uploadFile) throws Exception {
	      
	      logger.info(">>>>>"+ uploadFile[0].getOriginalFilename());
	      //=============================================================
	      PartnerVO tempVO =  uploadMethod(uploadFile);
	      logger.info(">>>>>"+tempVO);
	      String uuid = tempVO.getUuid();
	      String fileName = tempVO.getFileName();
	      String uploadPath = tempVO.getUploadPath();
	      //=============================================================
	      
	      
	      HttpSession session = request.getSession();
	      MemberVO vo = (MemberVO) session.getAttribute("loginSession");
	      String nickname = vo.getNickname(); // 로그인된 세션의 닉네임
	      String tempPartner_signal_fuck = Integer.toString(vo.getPartner_signal()); // 로그인된 세션의 파트너신호(등록 직플레이스 갯수로
	      int tempPartner_signal = Integer.parseInt(tempPartner_signal_fuck);
	      int update_siganl = tempPartner_signal + 1; // update 했다

	      logger.info("파트너 레지스터 :" + partner.toString());

	      int m_num;
	      m_num = service.selectnumber(nickname); // 회원에 번호 들고올라고 서치
	      logger.info("mNum : " + m_num);

	      update_siganl = tempPartner_signal + 1; // 더해주고 넣어줄꺼

	      // 세션 지우기
	      session.removeAttribute("loginSession");

	      partner.setM_num(m_num);
	      logger.info("변해라 ~~~ 포린키" + partner);
	      partner.setUuid(uuid);
	      partner.setUploadPath(uploadPath);
	      partner.setFileName(fileName);
	      // 파트너 저장하는 부분 ~~~========================ㄴ======================
	      logger.info("ㅈ같네 ~~~~~~~~~~~" + partner);
	      service.partnerRegister(partner);
	      

	      // 업데이트 넣어줄꺼 시발
	      MemberVO member = vo;
	      member.setPartner_signal(update_siganl);
	      member.setNickname(nickname);
	      service.partnerUpdate(member);
	      logger.info("바뀐 맴버 확인 ==== > : " + member);
	      // 업데이트 세션
	      session.setAttribute("loginSession", member);
	      
	      model.addAttribute("msg","SUCCESS");
	      rttr.addAttribute("msg","SUCCESS");
	      rttr.addFlashAttribute("msg","SUCCESSPARTNER");
	      return "redirect:/";
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
			object.put("uuid", partner.getUuid());
			object.put("uploadPath", partner.getUploadPath());
			object.put("fileName", partner.getFileName());
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

	// 파일 이미지 업로드 하는 매소드
	private PartnerVO uploadMethod(MultipartFile[] uploadFile) {
		// TODO Auto-generated method stub

		HttpServletRequest request = this.getRequest(); // HttpServletRequest 객체 얻기 위해서

		String uploadFolder = request.getServletContext().getRealPath("/resources");

		File RealuploadPath = new File(uploadFolder, this.getFolder()); // 파일 목적지 생성

		PartnerVO partnerVO = new PartnerVO();

		for (MultipartFile multipartFile : uploadFile) {

			multipartFile.getOriginalFilename();
			String uploadFileName = multipartFile.getOriginalFilename();
			partnerVO = new PartnerVO();

			partnerVO.setFileName(uploadFileName); // 파일 이름 저장

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(RealuploadPath, uploadFileName); // 파일 경로에 저잘될 파일 이름
				multipartFile.transferTo(saveFile);
				partnerVO.setUuid(uuid.toString());
				partnerVO.setUploadPath(this.getFolder());
			} catch (Exception e) {
				logger.error(e.getMessage());
			}

		}

		return partnerVO;

	}

	// 폴더 만드는 메서드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String addPartner = "partner/";
		Date date = new Date();
		String str = sdf.format(date);
		System.out.println("파일 반환전 : " + str); // 2019-03-31
		System.out.println("파일 반환후 : " + str.replace("-", File.separator)); // 2019/03/31 "/" 이걸로 변환
		return addPartner + str.replace("-", File.separator);

	}

	// HttpServletRequest 인터페이스 타입에 request객채 얻기
	public static HttpServletRequest getRequest() {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		return attr.getRequest();
	}

}
