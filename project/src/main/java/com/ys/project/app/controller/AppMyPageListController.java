package com.ys.project.app.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.NoticeBoardVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.WarningBoardReplyVO;
import com.ys.project.projectVO.WarningBoardVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.projectVO.joinProductVO;
import com.ys.project.projectVO.joinReviewVO;
import com.ys.project.service.member.IMemberService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

@RestController
@AllArgsConstructor
@RequestMapping(value = "/app/myPageList/**")

public class AppMyPageListController {

	private static final Logger log = LoggerFactory.getLogger(AppProductionController.class);

	private IMemberService service;


	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/nick")
	public MemberVO appMemberInquire(@RequestBody MemberVO vo) throws Exception {
		String nickname = vo.getNickname();
		vo = service.nickNameCheck(nickname);
		System.out.println("vo : "+vo);
		return vo;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/edit")
	public MemberVO appMemberEdit(@RequestBody MemberVO vo) throws Exception {
		
		int result = service.appMemberUpdate(vo);
		System.out.println("vo : "+vo);
		if(result > 0) {
			System.out.println("업데이트 성공");
			
			String nickname = vo.getNickname();
			vo = service.nickNameCheck(nickname);
			System.out.println("vo : "+vo);
			return vo;
			
		}else {
			System.out.println("실패");
			return vo;
		}
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/fileupload")
	public String fileupload() {
		System.out.println("거침");
		return null;
		
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/pickCount")
	public int appMemberPickCount(@RequestBody MemberVO member) throws Exception {
		int m_num = member.getM_num();
		System.out.println("pickCount m_num : "+m_num);
		int pickCount = service.totalPick(m_num);
		return pickCount;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/pick")
	public List<joinPickVO> appMemberPick(@RequestBody MemberVO member) throws Exception {
		String nickname = member.getNickname();
		member = service.nickNameCheck(nickname);
		int m_num = member.getM_num();
		System.out.println("member session storge : "+member);
		
		List<joinPickVO> vo;
		vo = service.joinPick(m_num);
		return vo;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/deletePick")
	public void appPickDelete(@RequestBody LikeListVO vo) throws Exception {
		
		System.out.println("delete request data : "+vo);
		service.deletePick(vo);
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/insertPick")
	public void appPickInsert(@RequestBody LikeListVO vo) throws Exception {
		
		System.out.println("Insert request data : "+vo);
		service.InsertPick(vo);
	}

	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/getPickCount")
	public int appGetPickCount(@RequestBody LikeListVO vo) throws Exception {
		
		System.out.println("getPickCount request data : "+vo);
		int count = service.getPickCount(vo);
		
		return count;	
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@GetMapping(value = "/reviewSearch" + "/{name}")
	public int appReviewSearch(@PathVariable("name") String name) throws Exception {
		
		int usingData = service.usingData(name);	
		
		return usingData;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@GetMapping(value = "/reviewInfo" + "/{name}")
	public MemberVO appReviewInfo(@PathVariable("name") String name) throws Exception {
		
		MemberVO vo = service.nickNameCheck(name);
		return vo;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@GetMapping(value = "/review" + "/{name}")
	public List<joinReviewVO> appReview(@PathVariable("name") String name) throws Exception {
		
		MemberVO member = service.nickNameCheck(name);
		System.out.println("otherPage : " + member);
		int num = member.getM_num();
	// --페이징 처리

		List<joinReviewVO> review = service.appReview(num);
				
		return review;
	}

	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/reviewCount")
	public int appReviewCount(@RequestBody MemberVO vo) throws Exception{
		
		MemberVO member = service.nickNameCheck(vo.getNickname());
		int num = member.getM_num();
		
		return service.getPagingListCount(num);
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@GetMapping(value = "/other" + "/{name}")
	public MemberVO appOtherInfo(@PathVariable("name") String name) throws Exception {
		System.out.println("otherInfo nameCheck : "+name);
		MemberVO member = service.nickNameCheck(name);
		
		return member;
	};
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/otherProduct")
	public List<joinProductVO> appOtherProduct(@RequestBody MemberVO other) throws Exception {
		System.out.println("otherProduct RequstBody VO : "+other);
		int m_num = other.getM_num();
		List<joinProductVO> vo = service.appOtherProduct(m_num);
		
		return vo;
	};
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/otherReview")
	public List<ProductionReviewVO> appOtherReview(@RequestBody MemberVO other) throws Exception {
		System.out.println("otherReview RequstBody VO : "+other);
		int m_num = other.getM_num();
		List<ProductionReviewVO> vo = service.appOtherReview(m_num);
		
		return vo;
	};
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/otherProductCount")
	public int appOtherProductCount(@RequestBody MemberVO other) throws Exception {
		System.out.println("otherProduct RequstBody VO : "+other);
		int m_num = other.getM_num();
		
		int count = service.myPageListCount(m_num);
		return count;
	};
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/otherReviewCount")
	public int appOtherReviewCount(@RequestBody MemberVO other) throws Exception {
		System.out.println("otherReview RequstBody VO : "+other);
		int m_num = other.getM_num();
		
		int count = service.appReviewCount(m_num);
		return count;
	};
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/Product")
	public List<joinProductVO> appProduct(@RequestBody MemberVO other) throws Exception{
		System.out.println("otherProduct RequstBody VO : "+other);
		int m_num = other.getM_num();
		List<joinProductVO> vo = service.appProduct(m_num);
		
		return vo;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/ProductDelete")
	public void appProductDelete(@RequestBody LikeListVO vo) throws Exception{
		System.out.println("LikeListVO : "+vo);
		// DB변경 on cascade production_upload , likelist;
		service.appProductDelete(vo);
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/NoticeBoard")
	public List<NoticeBoardVO> appnoticeboard() throws Exception{
		List<NoticeBoardVO> list = service.appNoticeBoard();
		return list;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/NoticeList")
	@ResponseBody
	public NoticeBoardVO appnoticelist(@RequestBody String no_num) throws Exception{
		String a = no_num.substring(0,(no_num.length()-1));
		System.out.println(a);
		int j = Integer.parseInt(a);
		NoticeBoardVO list = service.appNoticeList(a);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy년 MM월 dd일 HH시mm분ss초");
		String aa = format1.format(list.getUpdate_date());
		list.setUpdt_date(aa);
		
		return list;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/WarningBoard")
	public List<WarningBoardVO> appwarningboard() throws Exception{
		List<WarningBoardVO> list = service.appWarningBoard();
	return list;
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/WarningList")
	@ResponseBody
	public WarningBoardVO appWarninglist(@RequestBody String wa_num) throws Exception{
		String a = wa_num.substring(0,(wa_num.length()-1));
		System.out.println(a);
		int j = Integer.parseInt(a);
//		System.out.println(wa_num);
		WarningBoardVO list = service.appWarningList(a);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy년 MM월 dd일 HH시mm분ss초");
		String aa = format1.format(list.getUpdate_date());
		list.setUpdt_date(aa);
//		String bb = format1.format(list.getCret_date());
//		System.out.println(aa);
		
		return list;
	}

	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/InputReply")
	public void AppInputReply(@RequestBody WarningBoardReplyVO vo) throws Exception{
		String a = vo.toString(); 
		JSONParser jsonParser = new JSONParser();
		JSONObject obj = (JSONObject) jsonParser.parse(a);
		System.out.println("넘어오냐?" + a);
		service.appWarningReply(vo);
	}
}
