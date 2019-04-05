package com.ys.project.admin;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ys.project.admin.mapper.NoticeBoardMapper;
import com.ys.project.memberVO.Criteria;
import com.ys.project.memberVO.NoticeBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
@Log4j
public class BoardMapperTests {
	private static final Logger logger = LoggerFactory.getLogger(BoardMapperTests.class);
	@Setter(onMethod_=@Autowired)
	private NoticeBoardMapper mapper;
	
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("test");
		cri.setType("TC");
		
		List<NoticeBoardVO> list = mapper.getlistWithPagin(cri);
		list.forEach(board -> log.info(board));
	}
	
}
