package com.ys.project.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ys.project.dao.IMemberDao;
import com.ys.project.memberVO.MemberVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao dao;

	@Override
	public void registerMember(Map map) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public MemberVO loginMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("し劾い焼び君焼びい君びたしい");
		return dao.loginMember(memberVO);
	}

}
