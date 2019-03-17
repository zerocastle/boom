//package com.ys.project.test;
//
//import java.util.List;
//
//import org.junit.Ignore;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.slf4j.Logger;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
//public class BoardDAOTest {
//	private static final Logger Logger = org.slf4j.LoggerFactory.getLogger(BoardDAOTest.class);
//
//	@Autowired
//	private BoardDAO dao;
//
//	@Test
//	@Ignore
//	public void test() {
//		try {
//			Logger.info(dao.read(1).toString());
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//	@Test
//	@Ignore
//	public void testUpdate() throws Exception {
//		BoardVO board = new BoardVO();
//		board.setBno(1);
//		board.setTitle("수정된 글입니다.");
//		board.setContent("수정 테스트");
//		dao.update(board);
//
//	}
//
//	@Test
//	@Ignore
//	public void testDelete() throws Exception {
//		dao.delete(1);
//	}
//
//	@Test
//	@Ignore
//	public void testCreate() throws Exception {
//		BoardVO board = new BoardVO();
//		board.setTitle("hellow");
//		board.setContent("fuck");
//		board.setWriter("kys");
//		dao.create(board);
//	}
//
//	@Test @Ignore
//	public void testListPage() throws Exception {
//		int page = 2;
//		List<BoardVO> list = dao.listPage(page);
//
//		for (BoardVO boardVO : list) {
//			Logger.info(boardVO.getBno() + " : " + boardVO.getTitle());
//		}
//	}
//	
//	@Test
//	public void testListCriteria() throws Exception {
//		Criteria cri = new Criteria();
//		cri.setPage(2);
//		cri.setPerPageNum(10);
//		List<BoardVO> list = dao.listCriteria(cri);
//
//		for (BoardVO boardVO : list) {
//			Logger.info(boardVO.getBno() + " : " + boardVO.getTitle());
//		}
//	}
//
//}
