package com.ys.project.dao;

import java.util.Map;

import com.ys.project.memberVO.MemberVO;

public interface IMemberDao {
	
	public void registerMember(MemberVO map) throws Exception;
	
	public MemberVO loginMember(MemberVO memberVO) throws Exception;
	
	

}
