package com.ys.project.test;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ys.project.dao.member.IMemberDao;
import com.ys.project.dao.warningBoard.WarningBoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
public class BoardDAOTest {
	private static final Logger Logger = org.slf4j.LoggerFactory.getLogger(BoardDAOTest.class);

	@Autowired
	private IMemberDao dao;
	
	@Autowired
	private WarningBoardMapper warningMapper;


	@Test @Ignore
	public void testMemberConfirm() throws Exception {
		String nickname = "kys";
		dao.memberCheck(nickname);

	}

	@Test @Ignore
	public void testMemberDelete() throws Exception {
		String nickname = "kys";
		dao.memberDelete(nickname);
	}
	
	@Test 
	public void testWarningMapper() throws Exception {
		
		warningMapper.read(21);
	}

//   @Test @Ignore
//   public void testUpdate() throws Exception {
//      String nickname = "kys";
//   }

}