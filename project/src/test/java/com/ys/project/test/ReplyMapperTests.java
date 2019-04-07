package com.ys.project.test;

import java.util.stream.IntStream;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ys.project.dao.warningBoard.ReplyMapper;
import com.ys.project.projectVO.WarningBoardReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
@Log4j
public class ReplyMapperTests {

	private int[] wa_num = { 548, 547, 546, 533, 532 };

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Test @Ignore
	public void testMapper() {
		log.info(mapper);
	}

	@Test @Ignore
	public void testCreate() {

		IntStream.rangeClosed(1, 10).forEach(i -> {
			WarningBoardReplyVO vo = new WarningBoardReplyVO();

			vo.setReplyer("kys" + i);
			vo.setReply("´ñ±Û Å×½ºÆ® : " + i);
			vo.setWa_num(this.wa_num[i]);

			mapper.insert(vo);

		});

		log.info(mapper);
	}
	
	@Test
	public void testRed() {

		int reply_num = 2;
		
		WarningBoardReplyVO vo = mapper.read(2);
		
		log.info(vo);
	}

}
