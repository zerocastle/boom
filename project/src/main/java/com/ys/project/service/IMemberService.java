package com.ys.project.service;

import java.util.Map;

import com.ys.project.memberVO.MemberVO;

public interface IMemberService {

	public void registerMember(Map map) throws Exception;

	public MemberVO loginMember(MemberVO memberVO) throws Exception;

}
