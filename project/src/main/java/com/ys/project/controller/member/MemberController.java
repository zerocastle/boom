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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PageVO;
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
			object.put("nickname", vo.getNickname());
			return object.toString();
		} else {
			System.out.println("========================띠발띠발 띠발========");
			object.put("signal", "fail");
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
	   public String memberRegisterPost(Model model, MemberVO member, @RequestParam Map map,
	         @RequestParam("uploadFile") MultipartFile[] uploadFile, RedirectAttributes ra) throws Exception {
	      logger.info("맴버 레지스터 : " + map);

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

	// 닉네임 체크
	@RequestMapping(value = "nickNameCheck", method = RequestMethod.POST)
	@ResponseBody
	public int nickNameCheck(Model model, @RequestBody MemberVO vo, RedirectAttributes ra)
			throws Exception {

		int nickCheck = service.checkNick(vo);
		
		return nickCheck;
	}

	// 마이페이지 프로필
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(Model model, HttpServletRequest request, RedirectAttributes rttr,
			@ModelAttribute("joinPickVO") joinPickVO pv) throws Exception {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // 로그인된 세션의 닉네임
		System.out.println("러나ㅣ어리ㅏㄴㅇ" + session.getAttribute("loginSession"));
		logger.info("현재 세션의 정보 : " + member);

		model.addAttribute("member", member);
		int num = member.getM_num();
		// --페이징 처리
		int myPageListCount = service.myPageListCount(num);
		pv.setTotalCount(myPageListCount); // 페이징 처리를 위한 setter 호출
		pv.setM_num(num);
		PageVO pv2 = new PageVO();
		int totalCount = service.getPagingListCount(num); // 게시물 총갯수를 구한다
		pv2.setTotalCount(totalCount);

		System.out.println("확인 1==================== : " + pv);
		model.addAttribute("pv", pv2.getTotalCount());
		model.addAttribute("pageVO", pv);
		logger.info("totalCount // 게시 글 전체 수 : " + totalCount);
		int totalPick = service.totalPick(num);
		model.addAttribute("proCount",myPageListCount);
		model.addAttribute("like", totalPick);
		System.out.println("확인 2==================== : " + pv);

		// --페이징 처리

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확인 3==================== : " + pv);
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
		session.removeAttribute("loginSession");
		MemberVO after = service.nickNameCheck(vo.getNickname());
		session.setAttribute("loginSession", after);

		return vo;
	}

	// 마이페이지 상품
	@RequestMapping(value = "/myProduct", method = RequestMethod.GET)
	public String myPageProduct(Model model, HttpServletRequest request, RedirectAttributes rttr,
			@ModelAttribute("joinPickVO") joinPickVO pv) throws Exception {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // 로그인된 세션의 닉네임
		System.out.println("러나ㅣ어리ㅏㄴㅇ" + session.getAttribute("loginSession"));
		logger.info("현재 세션의 정보 : " + member);

		model.addAttribute("member", member);
		int num = member.getM_num();
		// --페이징 처리
		int myPageListCount = service.myPageListCount(num);
		pv.setTotalCount(myPageListCount); // 페이징 처리를 위한 setter 호출
		pv.setM_num(num);
		PageVO pv2 = new PageVO();
		int totalCount = service.getPagingListCount(num); // 게시물 총갯수를 구한다
		pv2.setTotalCount(totalCount);

		System.out.println("확인 1==================== : " + pv);
		model.addAttribute("pv", pv2.getTotalCount());
		model.addAttribute("pageVO", pv);
		logger.info("totalCount // 게시 글 전체 수 : " + totalCount);
		model.addAttribute("proCount",myPageListCount);
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		System.out.println("확인 2==================== : " + pv);

		// --페이징 처리

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확인 3==================== : " + pv);
		System.out.println("마이 페이지 : member/myPage");

		return "myPage/product";
	}

	// 타인 페이지 상품
	@RequestMapping(value = "other/" + "{data}", method = RequestMethod.GET)
	public String otherGET(Model model, @PathVariable String data, @ModelAttribute("joinPickVO") joinPickVO pv) throws Exception {

		MemberVO member = service.nickNameCheck(data);
		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);
		int num = member.getM_num();
		// --페이징 처리
		int myPageListCount = service.myPageListCount(num);
		pv.setTotalCount(myPageListCount); // 페이징 처리를 위한 setter 호출
		pv.setM_num(num);
		PageVO pv2 = new PageVO();
		int totalCount = service.getPagingListCount(num); // 게시물 총갯수를 구한다
		pv2.setTotalCount(totalCount);

		System.out.println("확인 1==================== : " + pv);
		model.addAttribute("pv", pv2.getTotalCount());
		model.addAttribute("pageVO", pv);
		logger.info("totalCount // 게시 글 전체 수 : " + totalCount);
		int totalPick = service.totalPick(num);
		model.addAttribute("proCount",myPageListCount);
		model.addAttribute("like", totalPick);
		System.out.println("확인 2==================== : " + pv);

		// --페이징 처리

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확인 3==================== : " + pv);
		System.out.println("마이 페이지 : member/myPage");

		return "/myPage/other";

	}
	//other review
	@RequestMapping(value = "otherReview/" + "{data}", method = RequestMethod.GET)
	public String otherReviewGET(Model model, @PathVariable String data,
			@ModelAttribute("ProductionReviewVO") ProductionReviewVO pv) throws Exception {
		int usingData = service.usingData(data);

		if (usingData == 1) {
			MemberVO member = service.nickNameCheck(data);
			System.out.println("otherPage : " + member);
			model.addAttribute("member", member);
			int num = member.getM_num();

			// --페이징 처리
			int totalCount = service.getPagingListCount(num); // 게시물 총갯수를 구한다
			model.addAttribute("pv", totalCount);
			pv.setM_num(num);
			pv.setTotalCount(totalCount); // 페이징 처리를 위한 setter 호출
			model.addAttribute("pageVO", pv);
			//
			int myPageListCount = service.myPageListCount(num);
			model.addAttribute("proCount",myPageListCount);
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


	// review 페이지
	@RequestMapping(value = "review/" + "{data}", method = RequestMethod.GET)
	public String ReviewGET(Model model, @PathVariable String data,
			@ModelAttribute("ProductionReviewVO") ProductionReviewVO pv) throws Exception {
		int usingData = service.usingData(data);

		if (usingData == 1) {
			MemberVO member = service.nickNameCheck(data);
			System.out.println("otherPage : " + member);
			model.addAttribute("member", member);
			int num = member.getM_num();

			// --페이징 처리
			int totalCount = service.getPagingListCount(num); // 게시물 총갯수를 구한다
			model.addAttribute("pv", totalCount);
			pv.setM_num(num);
			pv.setTotalCount(totalCount); // 페이징 처리를 위한 setter 호출
			model.addAttribute("pageVO", pv);
			//
			int myPageListCount = service.myPageListCount(num);
			model.addAttribute("proCount",myPageListCount);
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

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String gettest(Model model) throws Exception {

		String nickname = "지다빈";

		List<ProductionReviewVO> list = service.scrollPaging(nickname);
		model.addAttribute("review", list);
		return "myPage/test";

	}

	@RequestMapping(value = "test", method = RequestMethod.POST)
	@ResponseBody
	public List<ProductionReviewVO> posttest(@RequestBody ProductionReviewVO vo) throws Exception {

		String nick = "지다빈";
		MemberVO vo2 = new MemberVO();
		vo2.setNickname(nick);
		vo2.getNickname();
		Integer prnum = vo.getPr_num() - 1;
		Map map = new HashMap();
		map.put("pr_num", prnum);
		map.put("nickname", vo2.getNickname());
		return service.infiniteScrollDown(map);
	}

	@RequestMapping(value = "insertPick", method = RequestMethod.POST)
	@ResponseBody
	public int insertPick(Model model, @RequestBody LikeListVO vo, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		HttpSession session = request.getSession();

		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // 로그인된 세션의 닉네임
		int m_num = member.getM_num();
		vo.setM_num(m_num);
		System.out.println("로그인 세션의 m_num : " + m_num);
		System.out.println("로그인하고 가져온 pro_num : " + vo);
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
		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // 로그인된 세션의 닉네임
		System.out.println("러나ㅣ어리ㅏㄴㅇ" + session.getAttribute("loginSession"));
		logger.info("현재 세션의 정보 : " + member);

		model.addAttribute("member", member);
		System.out.println("확인 1==================== : " + pv);
		int num = member.getM_num();
		
		// 내상품 리스트
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount",myPageListCount);
		
		// --페이징 처리
		int totalCount = service.totalPick(num); // 게시물 총갯수를 구한다
		pv.setM_num(num);
		pv.setTotalCount(totalCount); // 페이징 처리를 위한 setter 호출
		model.addAttribute("pageVO", pv);
		// --페이징 처리
		int totalCount2 = service.getPagingListCount(num); // 게시물 총갯수를 구한다
		model.addAttribute("pv",totalCount2);
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		List<joinPickVO> resultList = service.joinPickPaging(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확인 2==================== : " + pv);
		return "/pick/pick";
	}
	
	// 구매내역
	@RequestMapping(value = "purchaseList/" + "{data}", method = RequestMethod.GET)
	public String purchaseList(Model model, @PathVariable String data, HttpServletRequest request) throws Exception {

		logger.info("구매 역 이동");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginSession");
		String nickName = memberVO.getNickname();
		
		// member정보
		MemberVO member = service.nickNameCheck(data);
		int num = member.getM_num();
		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);
		
		// 내상품 count
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount",myPageListCount);
		
		// 리뷰 count
		int totalCount2 = service.getPagingListCount(num); 
		model.addAttribute("pv",totalCount2);
		
		// 찜목록 count
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		
		List<PaymentVO> list = new ArrayList<PaymentVO>();
		list = service.getMemberPayment(data);
		model.addAttribute("paymentList", list);
		return "sell/purchaseList";

	}
	
	// 판매내역
	@RequestMapping(value = "sellList/" + "{data}", method = RequestMethod.GET)
	public String sellList(Model model, @PathVariable String data) throws Exception {

		logger.info("판매 내역 이동");
		
		// member정보
				MemberVO member = service.nickNameCheck(data);
				int num = member.getM_num();
				System.out.println("otherPage : " + member);
				model.addAttribute("member", member);
				
				// 내상품 count
				int myPageListCount = service.myPageListCount(num);
				model.addAttribute("proCount",myPageListCount);
				
				// 리뷰 count
				int totalCount2 = service.getPagingListCount(num); 
				model.addAttribute("pv",totalCount2);
				
				// 찜목록 count
				int totalPick = service.totalPick(num);
				model.addAttribute("like", totalPick);

		return "sell/sellList";

	}
	
	  // ===========================================================================================

	   // 파일 이미지 업로드 하는 매소드
	   private MemberVO uploadMethod(MultipartFile[] uploadFile) {
	      // TODO Auto-generated method stub

	      HttpServletRequest request = this.getRequest(); // HttpServletRequest 객체 얻기 위해서

	      String uploadFolder = request.getServletContext().getRealPath("/resources");

	      File RealuploadPath = new File(uploadFolder, this.getFolder()); // 파일 목적지 생성

	      MemberVO memberVO = new MemberVO();

	      for (MultipartFile multipartFile : uploadFile) {

	         multipartFile.getOriginalFilename();
	         String uploadFileName = multipartFile.getOriginalFilename();
	         memberVO = new MemberVO();

	         memberVO.setFileName(uploadFileName); // 파일 이름 저장

	         UUID uuid = UUID.randomUUID();

	         uploadFileName = uuid.toString() + "_" + uploadFileName;

	         try {
	            File saveFile = new File(RealuploadPath, uploadFileName); // 파일 경로에 저잘될 파일 이름
	            multipartFile.transferTo(saveFile);
	            memberVO.setUuid(uuid.toString());
	            memberVO.setUploadPath(this.getFolder());
	         } catch (Exception e) {
	            logger.error(e.getMessage());
	         }

	      }

	      return memberVO;

	   }

	   // 폴더 만드는 메서드
	   private String getFolder() {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      String addPartner = "member/";
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
