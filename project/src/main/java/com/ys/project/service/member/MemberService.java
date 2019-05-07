package com.ys.project.service.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ys.project.dao.member.IMemberDao;
import com.ys.project.projectVO.MemberVO;
import com.ys.project.projectVO.ProductionReviewVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao dao;

	@Override
	public void registerMember(Map map) throws Exception {
		dao.registerMember(map);
	}

	@Override
	public MemberVO loginMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ㅇ날ㄴ아ㅣ러아ㅣㄴ러ㅣㅏㅇㄴ");
		return dao.loginMember(memberVO);
	}

	@Override
	public MemberVO nickNameCheck(String nickName) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("닉네임 확인 : " + nickName);

		return dao.memberCheck(nickName);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.memberUpdate(vo);
	}

	@Override
	public List<ProductionReviewVO> getReivewData(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return dao.getReviewData(member);
	}

	@Override
	public List<ProductionReviewVO> getReivewData2(String data) throws Exception {
		// TODO Auto-generated method stub
		return dao.getReviewData2(data);
	}

	@Override
	public int getPagingListCount(int i) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPagingListCount(i);
	}

	@Override
	public List<ProductionReviewVO> getPagingList(ProductionReviewVO pv) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPagingList(pv);
	}

	@Override
	public List<ProductionReviewVO> scrollPaging(String nickname) throws Exception {
		// TODO Auto-generated method stub
			return dao.scrollPaging(nickname);
	}

	@Override
	public List<ProductionReviewVO> infiniteScrollDown(Map map) throws Exception {
		// TODO Auto-generated method stub
		return dao.infiniteScrollDown(map);
	}

	@Override
	public int usingData(String data) throws Exception {
		// TODO Auto-generated method stub
		return dao.usingData(data);
	}
}
