package com.ys.project.selling;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ys.project.dao.sellingUpdate.SellingUpdateMapper;
import com.ys.project.projectDTO.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
@Log4j
public class SellingUpdateMapperTest {

	@Setter(onMethod_ = @Autowired)
	private SellingUpdateMapper mapper;

	@Test
	public void getMemberTest() {

		/*
		 * Map map = new HashMap(); Criteria cri = new Criteria(1,6);
		 * 
		 * map.put("pageNum" , cri.getPageNum()); map.put("amount", cri.getAmount());
		 * map.put("m_num", 2);
		 * 
		 * log.info(map);
		 */

		int result = mapper.getMemberProductionTotalCount(2);
		log.info("ÃÑ °¹¼ö : " + result);

		/* log.info(mapper.getMemberProductionList(map)); */
	}

}
