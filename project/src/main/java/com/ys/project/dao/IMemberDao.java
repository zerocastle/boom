package com.ys.project.dao;

import java.util.Map;

import com.ys.project.memberVO.MemberVO;

public interface IMemberDao {
	
	//회원 가입
	public void registerMember(Map map) throws Exception;
	
	//로그인
	public MemberVO loginMember(MemberVO memberVO) throws Exception;
	
	//닉네임체크
	public MemberVO memberCheck(String nickName) throws Exception;
	
	// 회원 탈퇴
	public void memberDelete(String nickname) throws Exception;

}
