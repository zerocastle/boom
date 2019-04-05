package com.ys.project.service.member;

import java.util.Map;

import com.ys.project.projectVO.MemberVO;

public interface IMemberService {
	
	public void registerMember(Map map) throws Exception;

	public MemberVO loginMember(MemberVO memberVO) throws Exception;
	
	public MemberVO nickNameCheck(String nickName) throws Exception;

}
