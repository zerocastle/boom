package com.ys.project.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Ignore;
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

	@Test @Ignore
	
	public void testRegister() throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		MemberVO vo = new MemberVO("kys", "293455932", "123456", "ring321@naver.com", 5, "intro", 12, "", 4, "123-456",
				"sin");
		map.put("memberRegister", vo);
//		dao.registerMember(vo);

	}

	@Test @Ignore
	public void testMemberConfirm() throws Exception {
		String nickname = "kys";
		dao.memberCheck(nickname);

	}

	@Test 
	public void testMemberDelete() throws Exception {
		String nickname = "kys";
		dao.memberDelete(nickname);
	}

//   @Test @Ignore
//   public void testUpdate() throws Exception {
//      String nickname = "kys";
//   }

}