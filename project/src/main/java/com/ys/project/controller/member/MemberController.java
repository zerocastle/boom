package com.ys.project.controller.member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PageVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.PaymentVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.service.member.IMemberService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/member/**")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private IMemberService service;

	// 占싸깍옙占쏙옙 처占쏙옙
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model, @RequestParam Map map) throws Exception {

		return "login/login";

	}

	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPost(Model model, @RequestBody MemberVO vo, HttpServletRequest request) throws Exception {
		logger.info("===================================================> loginPost 占싼울옙占쏙옙 占쏙옙 : " + vo.toString());
		System.out.println("占쏙옙占쏙옙 占싼억옙 占쌉놂옙 ? " + vo);

		HttpSession session = request.getSession();

		JSONObject object = new JSONObject();
		vo = service.loginMember(vo);
		if (vo != null) {
			session.setAttribute("loginSession", vo);
			object.put("signal", "success");
			object.put("nickname", vo.getNickname());
			return object.toString();
		} else {
			System.out.println("========================占쏙옙渗占쏙옙 占쏙옙占�========");
			object.put("signal", "fail");
			return object.toString();
		}

	}

	// 占싸그아울옙
	@RequestMapping("logout")
	public String memberLogout(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	// 회占쏙옙 占쏙옙占쏙옙

	@RequestMapping(value = "memberRegister", method = RequestMethod.GET)
	public String memberRegister(Model model) throws Exception {

		return "login/memberRegister";

	}

	@RequestMapping(value = "memberRegister", method = RequestMethod.POST)
	public String memberRegisterPost(Model model, MemberVO member, @RequestParam Map map,
			@RequestParam("uploadFile") MultipartFile[] uploadFile, RedirectAttributes ra) throws Exception {
		logger.info("占심뱄옙 占쏙옙占쏙옙占쏙옙占쏙옙 : " + map);

		logger.info(">>>>>" + uploadFile[0].getOriginalFilename());
		// =============================================================
		MemberVO memberVO = this.uploadMethod(uploadFile);

		map.put("uuid", memberVO.getUuid());
		map.put("uploadPath", memberVO.getUploadPath());
		map.put("fileName", memberVO.getFileName());
		ra.addFlashAttribute("msg", "SUCCESS");
		service.registerMember(map);
		return "redirect:/";

	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	@ResponseBody
	public int RegisterPost(Model model, @RequestBody MemberVO vo, RedirectAttributes ra) throws Exception {
		int success = service.insertRegister(vo);

		return success;

	}

	// 占싻놂옙占쏙옙 체크
	@RequestMapping(value = "nickNameCheck", method = RequestMethod.POST)
	@ResponseBody
	public int nickNameCheck(Model model, @RequestBody MemberVO vo, RedirectAttributes ra) throws Exception {

		int nickCheck = service.checkNick(vo);

		return nickCheck;
	}

	// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "myPage/" + "{data}", method = RequestMethod.GET)
	public String myPage(Model model, HttpServletRequest request, RedirectAttributes rttr,
			@ModelAttribute("joinPickVO") joinPickVO pv, @PathVariable String data) throws Exception {

//		HttpSession session = request.getSession();
//		MemberVO mvo = (MemberVO) session.getAttribute("loginSession"); // 占싸깍옙占싸듸옙 占쏙옙占쏙옙占쏙옙 占싻놂옙占쏙옙
		MemberVO member = service.nickNameCheck(data);
//		System.out.println("占쏙옙占쏙옙占쌈어리占쏙옙占쏙옙占쏙옙" + session.getAttribute("loginSession"));
		logger.info("占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 : " + member);

		model.addAttribute("member", member);
		int num = member.getM_num();
		// --占쏙옙占쏙옙징 처占쏙옙
		int myPageListCount = service.myPageListCount(num);
		pv.setTotalCount(myPageListCount); // 占쏙옙占쏙옙징 처占쏙옙占쏙옙 占쏙옙占쏙옙 setter 호占쏙옙
		pv.setM_num(num);
		PageVO pv2 = new PageVO();
		int totalCount = service.getPagingListCount(num); // 占쌉시뱄옙 占싼곤옙占쏙옙占쏙옙 占쏙옙占싼댐옙
		pv2.setTotalCount(totalCount);

		System.out.println("확占쏙옙 1==================== : " + pv);
		model.addAttribute("pv", pv2.getTotalCount());
		model.addAttribute("pageVO", pv);
		logger.info("totalCount // 占쌉쏙옙 占쏙옙 占쏙옙체 占쏙옙 : " + totalCount);
		int totalPick = service.totalPick(num);
		model.addAttribute("proCount", myPageListCount);
		model.addAttribute("like", totalPick);
		System.out.println("확占쏙옙 2==================== : " + pv);

		// --占쏙옙占쏙옙징 처占쏙옙

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확占쏙옙 3==================== : " + pv);
		System.out.println("占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 : member/myPage");

		// 占쏙옙占쏙옙占쏙옙트占십띰옙占� 占쌉곤옙 占쏙옙품 占쏙옙占� 占쌨댐옙 占쏙옙占싱깍옙
		List<PartnerVO> placeList = service.getPlaceList(member.getM_num());

		model.addAttribute("placeList", JSONArray.fromObject(placeList));
		// 占쏙옙占쏙옙占쏙옙트占십띰옙占� 占쌉곤옙 占쏙옙품 占쏙옙占� 占쌨댐옙 占쏙옙占싱깍옙

		return "myPage/myPage";
	}

	// post 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value = "myPage", method = RequestMethod.POST)
	@ResponseBody
	public MemberVO memberUpdate(Model model, @RequestBody MemberVO vo, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO before = (MemberVO) session.getAttribute("loginSession"); // 占싸깍옙占싸듸옙 占쏙옙占쏙옙占쏙옙 占싻놂옙占쏙옙

		System.out.println("占쏙옙占쏙옙占쏙옙트 占실깍옙占쏙옙 : " + before);

		service.memberUpdate(vo);
		System.out.println("占쏙옙占쏙옙占쏙옙트 占쏙옙占쏙옙 : " + vo);
		session.removeAttribute("loginSession");
		MemberVO after = service.nickNameCheck(vo.getNickname());
		session.setAttribute("loginSession", after);

		return vo;
	}

	// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙품
	@RequestMapping(value = "/myProduct/" + "{data}", method = RequestMethod.GET)
	public String myPageProduct(Model model, HttpServletRequest request, RedirectAttributes rttr,
			@ModelAttribute("joinPickVO") joinPickVO pv, @PathVariable String data) throws Exception {

		/*
		 * HttpSession session = request.getSession(); MemberVO member = (MemberVO)
		 * session.getAttribute("loginSession"); // 占싸깍옙占싸듸옙 占쏙옙占쏙옙占쏙옙 占싻놂옙占쏙옙
		 * System.out.println("占쏙옙占쏙옙占쌈어리占쏙옙占쏙옙占쏙옙" +
		 * session.getAttribute("loginSession"));
		 */
		MemberVO member = service.nickNameCheck(data);
		logger.info("占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 : " + member);

		model.addAttribute("member", member);
		int num = member.getM_num();
		// --占쏙옙占쏙옙징 처占쏙옙
		int myPageListCount = service.myPageListCount(num);
		pv.setTotalCount(myPageListCount); // 占쏙옙占쏙옙징 처占쏙옙占쏙옙 占쏙옙占쏙옙 setter 호占쏙옙
		pv.setM_num(num);
		PageVO pv2 = new PageVO();
		int totalCount = service.getPagingListCount(num); // 占쌉시뱄옙 占싼곤옙占쏙옙占쏙옙 占쏙옙占싼댐옙
		pv2.setTotalCount(totalCount);

		System.out.println("확占쏙옙 1==================== : " + pv);
		model.addAttribute("pv", pv2.getTotalCount());
		model.addAttribute("pageVO", pv);
		logger.info("totalCount // 占쌉쏙옙 占쏙옙 占쏙옙체 占쏙옙 : " + totalCount);
		model.addAttribute("proCount", myPageListCount);
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		System.out.println("확占쏙옙 2==================== : " + pv);

		// --占쏙옙占쏙옙징 처占쏙옙

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확占쏙옙 3==================== : " + pv);
		System.out.println("占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 : member/myPage");

		return "myPage/product";
	}

	// 타占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙품
	@RequestMapping(value = "other/" + "{data}", method = RequestMethod.GET)
	public String otherGET(Model model, @PathVariable String data, @ModelAttribute("joinPickVO") joinPickVO pv)
			throws Exception {

		MemberVO member = service.nickNameCheck(data);
		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);
		int num = member.getM_num();
		// --占쏙옙占쏙옙징 처占쏙옙
		int myPageListCount = service.myPageListCount(num);
		pv.setTotalCount(myPageListCount); // 占쏙옙占쏙옙징 처占쏙옙占쏙옙 占쏙옙占쏙옙 setter 호占쏙옙
		pv.setM_num(num);
		PageVO pv2 = new PageVO();
		int totalCount = service.getPagingListCount(num); // 占쌉시뱄옙 占싼곤옙占쏙옙占쏙옙 占쏙옙占싼댐옙
		pv2.setTotalCount(totalCount);

		System.out.println("확占쏙옙 1==================== : " + pv);
		model.addAttribute("pv", pv2.getTotalCount());
		model.addAttribute("pageVO", pv);
		logger.info("totalCount // 占쌉쏙옙 占쏙옙 占쏙옙체 占쏙옙 : " + totalCount);
		int totalPick = service.totalPick(num);
		model.addAttribute("proCount", myPageListCount);
		model.addAttribute("like", totalPick);
		System.out.println("확占쏙옙 2==================== : " + pv);

		// --占쏙옙占쏙옙징 처占쏙옙

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확占쏙옙 3==================== : " + pv);
		System.out.println("占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 : member/myPage");

		return "/myPage/other";

	}

	// other review
	@RequestMapping(value = "otherReview/" + "{data}", method = RequestMethod.GET)
	public String otherReviewGET(Model model, @PathVariable String data,
			@ModelAttribute("ProductionReviewVO") ProductionReviewVO pv) throws Exception {
		int usingData = service.usingData(data);

		if (usingData == 1) {
			MemberVO member = service.nickNameCheck(data);
			System.out.println("otherPage : " + member);
			model.addAttribute("member", member);
			int num = member.getM_num();

			// --占쏙옙占쏙옙징 처占쏙옙
			int totalCount = service.getPagingListCount(num); // 占쌉시뱄옙 占싼곤옙占쏙옙占쏙옙 占쏙옙占싼댐옙
			model.addAttribute("pv", totalCount);
			pv.setM_num(num);
			pv.setTotalCount(totalCount); // 占쏙옙占쏙옙징 처占쏙옙占쏙옙 占쏙옙占쏙옙 setter 호占쏙옙
			model.addAttribute("pageVO", pv);
			//
			int myPageListCount = service.myPageListCount(num);
			model.addAttribute("proCount", myPageListCount);
			//
			int totalPick = service.totalPick(num);
			model.addAttribute("like", totalPick);

			List<ProductionReviewVO> reviewList = service.getPagingList(pv);
			model.addAttribute("resultList", reviewList);
			return "/myPage/otherReview";
		} else {
			model.addAttribute("data", data);
			return "/myPage/notReview";
		}

	}

	// review 占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "review/" + "{data}", method = RequestMethod.GET)
	public String ReviewGET(Model model, @PathVariable String data,
			@ModelAttribute("ProductionReviewVO") ProductionReviewVO pv) throws Exception {
		int usingData = service.usingData(data);

		if (usingData == 1) {
			MemberVO member = service.nickNameCheck(data);
			System.out.println("otherPage : " + member);
			model.addAttribute("member", member);
			int num = member.getM_num();

			// --占쏙옙占쏙옙징 처占쏙옙
			int totalCount = service.getPagingListCount(num); // 占쌉시뱄옙 占싼곤옙占쏙옙占쏙옙 占쏙옙占싼댐옙
			model.addAttribute("pv", totalCount);
			pv.setM_num(num);
			pv.setTotalCount(totalCount); // 占쏙옙占쏙옙징 처占쏙옙占쏙옙 占쏙옙占쏙옙 setter 호占쏙옙
			model.addAttribute("pageVO", pv);
			//
			int myPageListCount = service.myPageListCount(num);
			model.addAttribute("proCount", myPageListCount);
			//
			int totalPick = service.totalPick(num);
			model.addAttribute("like", totalPick);

			List<ProductionReviewVO> reviewList = service.getPagingList(pv);
			model.addAttribute("resultList", reviewList);
			return "/myPage/review";
		} else {
			model.addAttribute("data", data);
			return "/myPage/notReview";
		}

	}

	/*
	 * @RequestMapping(value = "test", method = RequestMethod.GET) public String
	 * gettest(Model model) throws Exception {
	 * 
	 * String nickname = "占쏙옙占쌕븝옙";
	 * 
	 * List<ProductionReviewVO> list = service.scrollPaging(nickname);
	 * model.addAttribute("review", list); return "myPage/test";
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "test", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<ProductionReviewVO> posttest(@RequestBody
	 * ProductionReviewVO vo) throws Exception {
	 * 
	 * String nick = "占쏙옙占쌕븝옙"; MemberVO vo2 = new MemberVO();
	 * vo2.setNickname(nick); vo2.getNickname(); Integer prnum = vo.getPr_num() - 1;
	 * Map map = new HashMap(); map.put("pr_num", prnum); map.put("nickname",
	 * vo2.getNickname()); return service.infiniteScrollDown(map); }
	 */

	@RequestMapping(value = "insertPick", method = RequestMethod.POST)
	@ResponseBody
	public int insertPick(Model model, @RequestBody LikeListVO vo, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		HttpSession session = request.getSession();

		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // 占싸깍옙占싸듸옙 占쏙옙占쏙옙占쏙옙 占싻놂옙占쏙옙
		int m_num = member.getM_num();
		vo.setM_num(m_num);
		System.out.println("占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙 m_num : " + m_num);
		System.out.println("占싸깍옙占쏙옙占싹곤옙 占쏙옙占쏙옙占쏙옙 pro_num : " + vo);
		int searchNo = service.searchPick(vo);
		System.out.println("searchNo : " + searchNo);
		if (searchNo == 1) {
			return searchNo;
		} else {
			service.insertPick(vo);
			return searchNo;
		}
	}

	@RequestMapping(value = "pickInfo/" + "{data}", method = RequestMethod.GET)
	public String pickInfo(Model model, @PathVariable String data, HttpServletRequest request, RedirectAttributes rttr,
			@ModelAttribute("joinPickVO") joinPickVO pv) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // 占싸깍옙占싸듸옙 占쏙옙占쏙옙占쏙옙 占싻놂옙占쏙옙
		System.out.println("占쏙옙占쏙옙占쌈어리占쏙옙占쏙옙占쏙옙" + session.getAttribute("loginSession"));
		logger.info("占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 : " + member);

		model.addAttribute("member", member);
		System.out.println("확占쏙옙 1==================== : " + pv);
		int num = member.getM_num();

		// 占쏙옙占쏙옙품 占쏙옙占쏙옙트
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount", myPageListCount);

		// --占쏙옙占쏙옙징 처占쏙옙
		int totalCount = service.totalPick(num); // 占쌉시뱄옙 占싼곤옙占쏙옙占쏙옙 占쏙옙占싼댐옙
		pv.setM_num(num);
		pv.setTotalCount(totalCount); // 占쏙옙占쏙옙징 처占쏙옙占쏙옙 占쏙옙占쏙옙 setter 호占쏙옙
		model.addAttribute("pageVO", pv);
		// --占쏙옙占쏙옙징 처占쏙옙
		int totalCount2 = service.getPagingListCount(num); // 占쌉시뱄옙 占싼곤옙占쏙옙占쏙옙 占쏙옙占싼댐옙
		model.addAttribute("pv", totalCount2);
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		List<joinPickVO> resultList = service.joinPickPaging(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확占쏙옙 2==================== : " + pv);
		return "/pick/pick";
	}

	// 占쏙옙占신놂옙占쏙옙
	@RequestMapping(value = "purchaseList/" + "{data}", method = RequestMethod.GET)
	public String purchaseList(Model model, @PathVariable String data, HttpServletRequest request) throws Exception {

		logger.info("占쏙옙占쏙옙 占쏙옙 占싱듸옙");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginSession");
		String nickName = memberVO.getNickname();

		// member占쏙옙占쏙옙
		MemberVO member = service.nickNameCheck(data);
		int num = member.getM_num();
		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);

		// 占쏙옙占쏙옙품 count
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount", myPageListCount);

		// 占쏙옙占쏙옙 count
		int totalCount2 = service.getPagingListCount(num);
		model.addAttribute("pv", totalCount2);

		// 占쏙옙占쏙옙 count
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);

		List<PaymentVO> list = new ArrayList<PaymentVO>();
		list = service.getMemberPayment(data);
		model.addAttribute("paymentList", list);
		return "sell/purchaseList";

	}

	// 占실매놂옙占쏙옙
	@RequestMapping(value = "sellList/" + "{data}", method = RequestMethod.GET)
	public String sellList(Model model, @PathVariable String data) throws Exception {

		logger.info("占실몌옙 占쏙옙占쏙옙 占싱듸옙");

		// member占쏙옙占쏙옙
		MemberVO member = service.nickNameCheck(data);
		int num = member.getM_num();
		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);

		// 占쏙옙占쏙옙품 count
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount", myPageListCount);

		// 占쏙옙占쏙옙 count
		int totalCount2 = service.getPagingListCount(num);
		model.addAttribute("pv", totalCount2);

		// 占쏙옙占쏙옙 count
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);

		return "sell/sellList";

	}

	// ===========================================================================================

	// 占쏙옙占쏙옙 占싱뱄옙占쏙옙 占쏙옙占싸듸옙 占싹댐옙 占신소듸옙
	private MemberVO uploadMethod(MultipartFile[] uploadFile) {
		// TODO Auto-generated method stub

		HttpServletRequest request = this.getRequest(); // HttpServletRequest 占쏙옙체 占쏙옙占� 占쏙옙占쌔쇽옙

		String uploadFolder = request.getServletContext().getRealPath("/resources");

		File RealuploadPath = new File(uploadFolder, this.getFolder()); // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙

		MemberVO memberVO = new MemberVO();

		for (MultipartFile multipartFile : uploadFile) {

			multipartFile.getOriginalFilename();
			String uploadFileName = multipartFile.getOriginalFilename();
			memberVO = new MemberVO();

			memberVO.setFileName(uploadFileName); // 占쏙옙占쏙옙 占싱몌옙 占쏙옙占쏙옙

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(RealuploadPath, uploadFileName); // 占쏙옙占쏙옙 占쏙옙恝占� 占쏙옙占쌩듸옙 占쏙옙占쏙옙 占싱몌옙
				multipartFile.transferTo(saveFile);
				memberVO.setUuid(uuid.toString());
				memberVO.setUploadPath(this.getFolder());
			} catch (Exception e) {
				logger.error(e.getMessage());
			}

		}

		return memberVO;

	}

	// 占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쌨쇽옙占쏙옙
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String addPartner = "member/";
		Date date = new Date();
		String str = sdf.format(date);
		System.out.println("占쏙옙占쏙옙 占쏙옙환占쏙옙 : " + str); // 2019-03-31
		System.out.println("占쏙옙占쏙옙 占쏙옙환占쏙옙 : " + str.replace("-", File.separator)); // 2019/03/31 "/" 占싱걸뤄옙 占쏙옙환
		return addPartner + str.replace("-", File.separator);

	}

	// HttpServletRequest 占쏙옙占쏙옙占쏙옙占싱쏙옙 타占쌉울옙 request占쏙옙채 占쏙옙占�
	public static HttpServletRequest getRequest() {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		return attr.getRequest();
	}

	// 占쏙옙占쏙옙占쏙옙트占쏙옙占쏙옙 占쌉곤옙占쏙옙 占쏙옙품 占쏙옙占�.
	@RequestMapping(value = "inProd/" + "{data}", method = RequestMethod.GET)
	public String inProd(Model model, @PathVariable String data) throws Exception {

		logger.info("占쏙옙占쏙옙 占쌉곤옙 占쏙옙占쏙옙 占싱듸옙");

		// member占쏙옙占쏙옙
		MemberVO member = service.nickNameCheck(data);
		int num = member.getM_num();
		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);

		// 占쏙옙占쏙옙품 count
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount", myPageListCount);

		// 占쏙옙占쏙옙 count
		int totalCount2 = service.getPagingListCount(num);
		model.addAttribute("pv", totalCount2);

		// 占쏙옙占쏙옙 count
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);

		// 占쏙옙占쏙옙占쏙옙트占십띰옙占� 占쌉곤옙 占쏙옙품 占쏙옙占� 占쌨댐옙 占쏙옙占싱깍옙
		List<PartnerVO> placeList = service.getPlaceList(member.getM_num());

		model.addAttribute("placeList", JSONArray.fromObject(placeList));
		// 占쏙옙占쏙옙占쏙옙트占십띰옙占� 占쌉곤옙 占쏙옙품 占쏙옙占� 占쌨댐옙 占쏙옙占싱깍옙

		// 占싹댐옙 占쏙옙占쏙옙 첫占쏙옙째 占쏙옙占시뤄옙占싱쏙옙 占쏙옙품占쏙옙占� 占쏙옙占�.
		List<HashMap<String, String>> inProdList = service.getInProdList(placeList.get(0).getPart_name());
		model.addAttribute("inProducts", JSONArray.fromObject(inProdList));
		// 占싹댐옙 占쏙옙占쏙옙 첫占쏙옙째 占쏙옙占시뤄옙占싱쏙옙 占쏙옙품占쏙옙占� 占쏙옙占�.

		return "inProd/fix-inProd";

	}

	@RequestMapping(value = "inProd2/" + "{data}", method = RequestMethod.GET)
	public String inProd2(Model model, @PathVariable String data) throws Exception {

		logger.info("ㅋㅋㅋ");
		MemberVO member = service.nickNameCheck(data);
		int num = member.getM_num();
		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);

		// 占쏙옙占쏙옙품 count
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount", myPageListCount);

		// 占쏙옙占쏙옙 count
		int totalCount2 = service.getPagingListCount(num);
		model.addAttribute("pv", totalCount2);

		// 占쏙옙占쏙옙 count
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);

		// 占쏙옙占쏙옙占쏙옙트占십띰옙占� 占쌉곤옙 占쏙옙품 占쏙옙占� 占쌨댐옙 占쏙옙占싱깍옙
		List<PartnerVO> placeList = service.getPlaceList(member.getM_num());

		model.addAttribute("placeList", JSONArray.fromObject(placeList));
		// 占쏙옙占쏙옙占쏙옙트占십띰옙占� 占쌉곤옙 占쏙옙품 占쏙옙占� 占쌨댐옙 占쏙옙占싱깍옙

		// 占싹댐옙 占쏙옙占쏙옙 첫占쏙옙째 占쏙옙占시뤄옙占싱쏙옙 占쏙옙품占쏙옙占� 占쏙옙占�.
		List<PartnerVO> partner = service.getPlaceList(member.getM_num());
		model.addAttribute("partner", JSONArray.fromObject(partner));
		// 占싹댐옙 占쏙옙占쏙옙 첫占쏙옙째 占쏙옙占시뤄옙占싱쏙옙 占쏙옙품占쏙옙占� 占쏙옙占�.

		return "inProd/fix-inProd2"; // 페이지로 포워딩된다.

	}

	@RequestMapping(value = "inProdList/"
			+ "{data}", method = RequestMethod.GET, produces = org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody String getInProdList(Model model, @PathVariable String data) throws Exception {
		List<HashMap<String, String>> inProdList = service.getInProdList(data);
		System.out.println("inProdList : ");
		System.out.println("inProdList : ");
		System.out.println("inProdList : ");
		System.out.println("inProdList : " + inProdList); // 2019-03-31
		System.out.println("inProdList : ");
		System.out.println("inProdList : ");
		JSONArray json = JSONArray.fromObject(inProdList);
		System.out.println("inProdList : ");
		System.out.println("inProdList : ");
		System.out.println("inProdList : " + json);
		System.out.println("inProdList : ");
		System.out.println("inProdList : ");
		System.out.println("inProdList : ");
		System.out.println("inProdList : ");

		String aa = json.toString();
		model.addAttribute("inProducts", aa);
		System.out.println(json);
		return aa;

	}

	@RequestMapping(value = "partname/" + "{data}", method = RequestMethod.GET)
	public String PartList(Model model, @PathVariable String data, HttpServletRequest request) throws Exception {
		logger.info("ㅋㅋㅋ");
		PartnerVO partner = service.partnerManage(data);
		int num = partner.getM_num();
		System.out.println("otherPage : " + partner);
		model.addAttribute("partner", partner);

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginSession");

		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);

		// 占쏙옙占쏙옙품 count
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount", myPageListCount);

		// 占쏙옙占쏙옙 count
		int totalCount2 = service.getPagingListCount(num);
		model.addAttribute("pv", totalCount2);

		// 占쏙옙占쏙옙 count
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);

//		List<PartnerVO> placeList = service.getPlaceList(member.getM_num());
//		model.addAttribute("placeList", JSONArray.fromObject(placeList));
		return "inProd/fix-inProd3";
	}
	
	@ResponseBody
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@RequestBody PartnerVO vo) {		
		System.out.println(vo);
		service.partnerUpdate(vo);
		JSONObject object = new JSONObject();
		object.put("result", vo.getPart_name());
		return object.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "delete", method = {RequestMethod.GET, RequestMethod.POST})
	public void delete(Model model, HttpSession session, @RequestBody List<Map<String, Object>> chArr) throws Exception {
		
		logger.info("delete");
		
		MemberVO member = (MemberVO)session.getAttribute("loginSession");
		model.addAttribute("member", member);
		
		
		for (int i = 0; i < chArr.size(); i++) {
			String aa = (String)chArr.get(i).get("c_num");
			service.partnerDelete(aa);
		}
		
		System.out.println("땡!");
		
	}
	
	@ResponseBody
	@RequestMapping(value = "prodelete", method = {RequestMethod.GET, RequestMethod.POST})
	public void prodelete(Model model, HttpSession session, @RequestBody List<Map<String, Object>> pro) throws Exception {
logger.info("delete");
		
		MemberVO member = (MemberVO)session.getAttribute("loginSession");
		model.addAttribute("member", member);
		
		
		for (int i = 0; i < pro.size(); i++) {
			String aa = (String)pro.get(i).get("p_num");
			service.partnerProdelete(aa);
		}
		
		System.out.println("땡!");
	}

}
