package com.ys.project.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PageVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.service.member.IMemberService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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

	// 마이페이지 , // 해당 세션의 닉네임 정보 조회 , // 닉네임으로 상점 후기 정보 데이터 추출
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(Model model, Model model2, HttpServletRequest request, RedirectAttributes rttr,
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

	// 타인 페이지
	@RequestMapping(value = "other/" + "{data}", method = RequestMethod.GET)
	public String otherGET(Model model, @PathVariable String data) throws Exception {

		MemberVO member = service.nickNameCheck(data);
		System.out.println("otherPage : " + member);
		model.addAttribute("other", member);
		int num = member.getM_num();

		// --페이징 처리
		int totalCount = service.getPagingListCount(num); // 게시물 총갯수를 구한다
		PageVO pv = new PageVO();
		pv.setTotalCount(totalCount); // 페이징 처리를 위한 setter 호출
		model.addAttribute("pv", pv.getTotalCount());
		logger.info("totalCount // 게시 글 전체 수 : " + totalCount);

		return "/myPage/other";

	}

	// review 페이지
	@RequestMapping(value = "review/" + "{data}", method = RequestMethod.GET)
	public String otherReviewGET(Model model, @PathVariable String data,
			@ModelAttribute("ProductionReviewVO") ProductionReviewVO pv) throws Exception {
		int usingData = service.usingData(data);

		if (usingData == 1) {
			MemberVO member = service.nickNameCheck(data);
			System.out.println("otherPage : " + member);
			model.addAttribute("other", member);
			int num = member.getM_num();

			// --페이징 처리
			int totalCount = service.getPagingListCount(num); // 게시물 총갯수를 구한다
			pv.setM_num(num);
			pv.setTotalCount(totalCount); // 페이징 처리를 위한 setter 호출
			model.addAttribute("pageVO", pv);
			// --페이징 처리

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
		// --페이징 처리
		int totalCount = service.totalPick(num); // 게시물 총갯수를 구한다
		pv.setM_num(num);
		pv.setTotalCount(totalCount); // 페이징 처리를 위한 setter 호출
		model.addAttribute("pageVO", pv);
		// --페이징 처리

		List<joinPickVO> resultList = service.joinPickPaging(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("확인 2==================== : " + pv);
		return "/pick/pick";
	}

}
