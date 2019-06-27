package com.ys.project.controller.member;

import java.awt.PageAttributes.MediaType;
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
	   public String memberRegisterPost(Model model, MemberVO member, @RequestParam Map map,
	         @RequestParam("uploadFile") MultipartFile[] uploadFile, RedirectAttributes ra) throws Exception {
	      logger.info("�ɹ� �������� : " + map);

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

	// �г��� üũ
	@RequestMapping(value = "nickNameCheck", method = RequestMethod.POST)
	@ResponseBody
	public int nickNameCheck(Model model, @RequestBody MemberVO vo, RedirectAttributes ra)
			throws Exception {

		int nickCheck = service.checkNick(vo);
		
		return nickCheck;
	}

	// ���������� ������
	@RequestMapping(value = "myPage/" + "{data}", method = RequestMethod.GET)
	public String myPage(Model model, HttpServletRequest request, RedirectAttributes rttr,
			@ModelAttribute("joinPickVO") joinPickVO pv, @PathVariable String data) throws Exception {

//		HttpSession session = request.getSession();
//		MemberVO mvo = (MemberVO) session.getAttribute("loginSession"); // �α��ε� ������ �г���
		MemberVO member = service.nickNameCheck(data);
//		System.out.println("�����Ӿ������" + session.getAttribute("loginSession"));
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
		model.addAttribute("proCount",myPageListCount);
		model.addAttribute("like", totalPick);
		System.out.println("Ȯ�� 2==================== : " + pv);

		// --����¡ ó��

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("Ȯ�� 3==================== : " + pv);
		System.out.println("���� ������ : member/myPage");

		//������Ʈ�ʶ�� �԰� ��ǰ ��� �޴� ���̱�
				List<PartnerVO> placeList = service.getPlaceList(member.getM_num());
				
				model.addAttribute("placeList",JSONArray.fromObject(placeList));
				//������Ʈ�ʶ�� �԰� ��ǰ ��� �޴� ���̱�
		
		
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

	// ���������� ��ǰ
	@RequestMapping(value = "/myProduct/" + "{data}", method = RequestMethod.GET)
	public String myPageProduct(Model model, HttpServletRequest request, RedirectAttributes rttr,
			@ModelAttribute("joinPickVO") joinPickVO pv,  @PathVariable String data) throws Exception {

		/*
		 * HttpSession session = request.getSession(); MemberVO member = (MemberVO)
		 * session.getAttribute("loginSession"); // �α��ε� ������ �г���
		 * System.out.println("�����Ӿ������" + session.getAttribute("loginSession"));
		 */
		MemberVO member = service.nickNameCheck(data);
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
		model.addAttribute("proCount",myPageListCount);
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		System.out.println("Ȯ�� 2==================== : " + pv);

		// --����¡ ó��

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("Ȯ�� 3==================== : " + pv);
		System.out.println("���� ������ : member/myPage");

		return "myPage/product";
	}

	// Ÿ�� ������ ��ǰ
	@RequestMapping(value = "other/" + "{data}", method = RequestMethod.GET)
	public String otherGET(Model model, @PathVariable String data, @ModelAttribute("joinPickVO") joinPickVO pv) throws Exception {

		MemberVO member = service.nickNameCheck(data);
		System.out.println("otherPage : " + member);
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
		model.addAttribute("proCount",myPageListCount);
		model.addAttribute("like", totalPick);
		System.out.println("Ȯ�� 2==================== : " + pv);

		// --����¡ ó��

		List<joinPickVO> resultList = service.myPageList(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("Ȯ�� 3==================== : " + pv);
		System.out.println("���� ������ : member/myPage");

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

			// --����¡ ó��
			int totalCount = service.getPagingListCount(num); // �Խù� �Ѱ����� ���Ѵ�
			model.addAttribute("pv", totalCount);
			pv.setM_num(num);
			pv.setTotalCount(totalCount); // ����¡ ó���� ���� setter ȣ��
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


	// review ������
	@RequestMapping(value = "review/" + "{data}", method = RequestMethod.GET)
	public String ReviewGET(Model model, @PathVariable String data,
			@ModelAttribute("ProductionReviewVO") ProductionReviewVO pv) throws Exception {
		int usingData = service.usingData(data);

		if (usingData == 1) {
			MemberVO member = service.nickNameCheck(data);
			System.out.println("otherPage : " + member);
			model.addAttribute("member", member);
			int num = member.getM_num();

			// --����¡ ó��
			int totalCount = service.getPagingListCount(num); // �Խù� �Ѱ����� ���Ѵ�
			model.addAttribute("pv", totalCount);
			pv.setM_num(num);
			pv.setTotalCount(totalCount); // ����¡ ó���� ���� setter ȣ��
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

	/*
	 * @RequestMapping(value = "test", method = RequestMethod.GET) public String
	 * gettest(Model model) throws Exception {
	 * 
	 * String nickname = "���ٺ�";
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
	 * String nick = "���ٺ�"; MemberVO vo2 = new MemberVO(); vo2.setNickname(nick);
	 * vo2.getNickname(); Integer prnum = vo.getPr_num() - 1; Map map = new
	 * HashMap(); map.put("pr_num", prnum); map.put("nickname", vo2.getNickname());
	 * return service.infiniteScrollDown(map); }
	 */

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
		
		// ����ǰ ����Ʈ
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount",myPageListCount);
		
		// --����¡ ó��
		int totalCount = service.totalPick(num); // �Խù� �Ѱ����� ���Ѵ�
		pv.setM_num(num);
		pv.setTotalCount(totalCount); // ����¡ ó���� ���� setter ȣ��
		model.addAttribute("pageVO", pv);
		// --����¡ ó��
		int totalCount2 = service.getPagingListCount(num); // �Խù� �Ѱ����� ���Ѵ�
		model.addAttribute("pv",totalCount2);
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		List<joinPickVO> resultList = service.joinPickPaging(pv);
		model.addAttribute("resultList", JSONArray.fromObject(resultList));
		System.out.println("Ȯ�� 2==================== : " + pv);
		return "/pick/pick";
	}
	
	// ���ų���
	@RequestMapping(value = "purchaseList/" + "{data}", method = RequestMethod.GET)
	public String purchaseList(Model model, @PathVariable String data, HttpServletRequest request) throws Exception {

		logger.info("���� �� �̵�");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginSession");
		String nickName = memberVO.getNickname();
		
		// member����
		MemberVO member = service.nickNameCheck(data);
		int num = member.getM_num();
		System.out.println("otherPage : " + member);
		model.addAttribute("member", member);
		
		// ����ǰ count
		int myPageListCount = service.myPageListCount(num);
		model.addAttribute("proCount",myPageListCount);
		
		// ���� count
		int totalCount2 = service.getPagingListCount(num); 
		model.addAttribute("pv",totalCount2);
		
		// ���� count
		int totalPick = service.totalPick(num);
		model.addAttribute("like", totalPick);
		
		List<PaymentVO> list = new ArrayList<PaymentVO>();
		list = service.getMemberPayment(data);
		model.addAttribute("paymentList", list);
		return "sell/purchaseList";

	}
	
	// �Ǹų���
	@RequestMapping(value = "sellList/" + "{data}", method = RequestMethod.GET)
	public String sellList(Model model, @PathVariable String data) throws Exception {

		logger.info("�Ǹ� ���� �̵�");
		
		// member����
				MemberVO member = service.nickNameCheck(data);
				int num = member.getM_num();
				System.out.println("otherPage : " + member);
				model.addAttribute("member", member);
				
				// ����ǰ count
				int myPageListCount = service.myPageListCount(num);
				model.addAttribute("proCount",myPageListCount);
				
				// ���� count
				int totalCount2 = service.getPagingListCount(num); 
				model.addAttribute("pv",totalCount2);
				
				// ���� count
				int totalPick = service.totalPick(num);
				model.addAttribute("like", totalPick);

		return "sell/sellList";

	}
	
	  // ===========================================================================================

	   // ���� �̹��� ���ε� �ϴ� �żҵ�
	   private MemberVO uploadMethod(MultipartFile[] uploadFile) {
	      // TODO Auto-generated method stub

	      HttpServletRequest request = this.getRequest(); // HttpServletRequest ��ü ��� ���ؼ�

	      String uploadFolder = request.getServletContext().getRealPath("/resources");

	      File RealuploadPath = new File(uploadFolder, this.getFolder()); // ���� ������ ����

	      MemberVO memberVO = new MemberVO();

	      for (MultipartFile multipartFile : uploadFile) {

	         multipartFile.getOriginalFilename();
	         String uploadFileName = multipartFile.getOriginalFilename();
	         memberVO = new MemberVO();

	         memberVO.setFileName(uploadFileName); // ���� �̸� ����

	         UUID uuid = UUID.randomUUID();

	         uploadFileName = uuid.toString() + "_" + uploadFileName;

	         try {
	            File saveFile = new File(RealuploadPath, uploadFileName); // ���� ��ο� ���ߵ� ���� �̸�
	            multipartFile.transferTo(saveFile);
	            memberVO.setUuid(uuid.toString());
	            memberVO.setUploadPath(this.getFolder());
	         } catch (Exception e) {
	            logger.error(e.getMessage());
	         }

	      }

	      return memberVO;

	   }

	   // ���� ����� �޼���
	   private String getFolder() {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      String addPartner = "member/";
	      Date date = new Date();
	      String str = sdf.format(date);
	      System.out.println("���� ��ȯ�� : " + str); // 2019-03-31
	      System.out.println("���� ��ȯ�� : " + str.replace("-", File.separator)); // 2019/03/31 "/" �̰ɷ� ��ȯ
	      return addPartner + str.replace("-", File.separator);

	   }

	   // HttpServletRequest �������̽� Ÿ�Կ� request��ä ���
	   public static HttpServletRequest getRequest() {
	      ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
	      return attr.getRequest();
	   }
						
	   // ������Ʈ���� �԰��� ��ǰ ���.
	   @RequestMapping(value = "inProd/" + "{data}", method = RequestMethod.GET)
	   public String inProd(Model model, @PathVariable String data) throws Exception {

			logger.info("���� �԰� ���� �̵�");
			
			// member����
					MemberVO member = service.nickNameCheck(data);
					int num = member.getM_num();
					System.out.println("otherPage : " + member);
					model.addAttribute("member", member);
					
					// ����ǰ count
					int myPageListCount = service.myPageListCount(num);
					model.addAttribute("proCount",myPageListCount);
					
					// ���� count
					int totalCount2 = service.getPagingListCount(num); 
					model.addAttribute("pv",totalCount2);
					
					// ���� count
					int totalPick = service.totalPick(num);
					model.addAttribute("like", totalPick);
					
					//������Ʈ�ʶ�� �԰� ��ǰ ��� �޴� ���̱�
					List<PartnerVO> placeList = service.getPlaceList(member.getM_num());
					
					model.addAttribute("placeList",JSONArray.fromObject(placeList));
					//������Ʈ�ʶ�� �԰� ��ǰ ��� �޴� ���̱�
					
					//�ϴ� ���� ù��° ���÷��̽� ��ǰ��� ���.
					List<HashMap<String, String>> inProdList = service.getInProdList(placeList.get(0).getPart_name());
					model.addAttribute("inProducts",JSONArray.fromObject(inProdList));
					//�ϴ� ���� ù��° ���÷��̽� ��ǰ��� ���.
					
					
			return "inProd/fix-inProd";

		}
	   
	   @RequestMapping(value = "inProdList/" + "{data}", method = RequestMethod.GET , produces =org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
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
	   
}
