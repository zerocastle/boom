package com.ys.project.app.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ys.project.projectVO.LikeListVO;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.ProductionReviewVO;
import com.ys.project.projectVO.joinPickVO;
import com.ys.project.projectVO.joinProductVO;
import com.ys.project.projectVO.joinReviewVO;
import com.ys.project.service.member.IMemberService;

import lombok.AllArgsConstructor;

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
			System.out.println("������Ʈ ����");
			
			String nickname = vo.getNickname();
			vo = service.nickNameCheck(nickname);
			System.out.println("vo : "+vo);
			return vo;
			
		}else {
			System.out.println("����");
			return vo;
		}
	}
	
	@CrossOrigin(origins = "*", maxAge = 3600)
	@PostMapping(value = "/fileupload")
	public String fileupload() {
		System.out.println("��ħ");
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
	// --����¡ ó��

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
		// DB���� on cascade production_upload , likelist;
		service.appProductDelete(vo);
	}
}
