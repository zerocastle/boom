package com.ys.project.selling;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ys.project.dao.production.ProductionMapper;
import com.ys.project.dao.sellingUpdate.SellingUpdateMapper;
import com.ys.project.service.production.IProductionService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
@Log4j
public class SellingUpdateMapperTest {

	@Setter(onMethod_ = @Autowired)
	private SellingUpdateMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private ProductionMapper productionMapper;

	@Setter(onMethod_ = @Autowired)
	private IProductionService proService;

	@Test
	@Ignore
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
		log.info("총 갯수 : " + result);

		/* log.info(mapper.getMemberProductionList(map)); */
	}

	@Test
	@Transactional
	public void getProduction() {

		int pro_num = 2;

		log.info("첫번쨰  : " + productionMapper.fineByPro(pro_num));

		log.info("두번쨰  : " + productionMapper.proMemberJoin(pro_num));

	}

	@Test
	public void serviceTest() {

		log.info("테스트 뭐가 오니 ? " + proService.totalFineByPro(2));

	}

}
