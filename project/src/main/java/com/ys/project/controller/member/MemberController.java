package com.ys.project.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.PageVO;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.service.member.IMemberService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private IMemberService service;

	// �α��� ó��
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model, @RequestParam Map map) throws Exception {

		return "login/login";

	}

	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPost(Model model, @RequestBody MemberVO vo, HttpServletRequest request) throws Exception {
		logger.info("===================================================> loginPost �ѿ��� �� : " + vo.toString());
		System.out.println("���� �Ѿ� �Գ� ? " + vo);

		HttpSession session = request.getSession();

		JSONObject object = new JSONObject();
		vo = service.loginMember(vo);
		if (vo != null) {
			session.setAttribute("loginSession", vo);
			object.put("signal", "success");
			object.put("nickname", vo.getNickname());
			return object.toString();
		} else {
			System.out.println("========================��߶�� ���========");
			object.put("signal", "fail");
			return object.toString();
		}

	}

	// �α׾ƿ�
	@RequestMapping("logout")
	public String memberLogout(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	// ȸ�� ����

	@RequestMapping(value = "memberRegister", method = RequestMethod.GET)
	public String memberRegister(Model model) throws Exception {

		return "login/memberRegister";

	}

	@RequestMapping(value = "memberRegister", method = RequestMethod.POST)
	public String memberRegisterPost(Model model, @RequestParam Map map, RedirectAttributes ra) throws Exception {
		logger.info("�ɹ� �������� : " + map);
		ra.addFlashAttribute("msg", "SUCCESS");
		service.registerMember(map);
		return "redirect:/";

	}

	// �г��� üũ
	@RequestMapping(value = "nickNameCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> nickNameCheck(Model model, @RequestBody MemberVO nickName, RedirectAttributes ra)
			throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		logger.info("�г��� üũ : " + nickName);
		nickName = service.nickNameCheck(nickName.getNickname());
		if (nickName == null) {
			map.put("signal", "SUCCESS");
		} else
			map.put("signal", "fail");
		return map;

	}

	// ���������� , // �ش� ������ �г��� ���� ��ȸ , // �г������� ���� �ı� ���� ������ ����
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(Model model, Model model2, HttpServletRequest request, RedirectAttributes rttr,
			@ModelAttribute("joinPickVO") joinPickVO pv) throws Exception {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // �α��ε� ������ �г���
		System.out.println("�����Ӿ������" + session.getAttribute("loginSession"));
		logger.info("���� ������ ���� : " + member);

		model.addAttribute("member", member);
		int num = member.getM_num();
		// --����¡ ó��
		int myPageListCount = service.myPageListCount(num);
		pv.setTotalCount(myPageListCount); // ����¡ ó���� ���� setter ȣ��
		pv.setM_num(num);
		PageVO pv2 = new PageVO();
		int totalCount = service.getPagingListCount(num); // �Խù� �Ѱ����� ���Ѵ�
		pv2.setTotalCount(totalCount);

		System.out.println("Ȯ�� 1==================== : " + pv);
		model.addAttribute("pv", pv2.getTotalCount());
		model.addAttribute("pageVO", pv);
		logger.info("totalCount // �Խ� �� ��ü �� : " + totalCount);
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		System.out.println("Ȯ�� 2==================== : " + pv);

		// --����¡ ó��

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("Ȯ�� 3==================== : " + pv);
		System.out.println("���� ������ : member/myPage");

		return "myPage/myPage";
	}

	// post ������ ����
	@RequestMapping(value = "myPage", method = RequestMethod.POST)
	@ResponseBody
	public MemberVO memberUpdate(Model model, @RequestBody MemberVO vo, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MemberVO before = (MemberVO) session.getAttribute("loginSession"); // �α��ε� ������ �г���

		System.out.println("������Ʈ �Ǳ��� : " + before);

		service.memberUpdate(vo);
		System.out.println("������Ʈ ���� : " + vo);
		session.removeAttribute("loginSession");
		MemberVO after = service.nickNameCheck(vo.getNickname());
		session.setAttribute("loginSession", after);

		return vo;
	}

	// Ÿ�� ������
	@RequestMapping(value = "other/" + "{data}", method = RequestMethod.GET)
	public String otherGET(Model model, @PathVariable String data) throws Exception {

		MemberVO member = service.nickNameCheck(data);
		System.out.println("otherPage : " + member);
		model.addAttribute("other", member);
		int num = member.getM_num();

		// --����¡ ó��
		int totalCount = service.getPagingListCount(num); // �Խù� �Ѱ����� ���Ѵ�
		PageVO pv = new PageVO();
		pv.setTotalCount(totalCount); // ����¡ ó���� ���� setter ȣ��
		model.addAttribute("pv", pv.getTotalCount());
		logger.info("totalCount // �Խ� �� ��ü �� : " + totalCount);

		return "/myPage/other";

	}

	// review ������
	@RequestMapping(value = "review/" + "{data}", method = RequestMethod.GET)
	public String otherReviewGET(Model model, @PathVariable String data,
			@ModelAttribute("ProductionReviewVO") ProductionReviewVO pv) throws Exception {
		int usingData = service.usingData(data);

		if (usingData == 1) {
			MemberVO member = service.nickNameCheck(data);
			System.out.println("otherPage : " + member);
			model.addAttribute("other", member);
			int num = member.getM_num();

			// --����¡ ó��
			int totalCount = service.getPagingListCount(num); // �Խù� �Ѱ����� ���Ѵ�
			pv.setM_num(num);
			pv.setTotalCount(totalCount); // ����¡ ó���� ���� setter ȣ��
			model.addAttribute("pageVO", pv);
			// --����¡ ó��

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

		String nickname = "���ٺ�";

		List<ProductionReviewVO> list = service.scrollPaging(nickname);
		model.addAttribute("review", list);
		return "myPage/test";

	}

	@RequestMapping(value = "test", method = RequestMethod.POST)
	@ResponseBody
	public List<ProductionReviewVO> posttest(@RequestBody ProductionReviewVO vo) throws Exception {

		String nick = "���ٺ�";
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

		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // �α��ε� ������ �г���
		int m_num = member.getM_num();
		vo.setM_num(m_num);
		System.out.println("�α��� ������ m_num : " + m_num);
		System.out.println("�α����ϰ� ������ pro_num : " + vo);
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
		MemberVO member = (MemberVO) session.getAttribute("loginSession"); // �α��ε� ������ �г���
		System.out.println("�����Ӿ������" + session.getAttribute("loginSession"));
		logger.info("���� ������ ���� : " + member);

		model.addAttribute("member", member);
		System.out.println("Ȯ�� 1==================== : " + pv);
		int num = member.getM_num();
		// --����¡ ó��
		int totalCount = service.totalPick(num); // �Խù� �Ѱ����� ���Ѵ�
		pv.setM_num(num);
		pv.setTotalCount(totalCount); // ����¡ ó���� ���� setter ȣ��
		model.addAttribute("pageVO", pv);
		// --����¡ ó��

		List<joinPickVO> resultList = service.joinPickPaging(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("Ȯ�� 2==================== : " + pv);
		return "/pick/pick";
	}

}
