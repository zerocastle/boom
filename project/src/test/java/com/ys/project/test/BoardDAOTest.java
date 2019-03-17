package com.ys.project.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ys.project.dao.IMemberDao;
import com.ys.project.memberVO.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
public class BoardDAOTest {
	private static final Logger Logger = org.slf4j.LoggerFactory.getLogger(BoardDAOTest.class);

	@Autowired
	private IMemberDao dao;

	@Test
	public void testUpdate() throws Exception {

		MemberVO vo = new MemberVO();
		vo.setPhone("123-456");
		vo.setM_password("123456");
//		dao.loginMember(map);

	}

}
