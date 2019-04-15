package com.ys.project.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ys.project.dao.sellingUpdate.SellingUpdateMapper;
import com.ys.project.projectVO.ProductionVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
@Log4j

public class UploadTest {
	@Setter(onMethod_ = @Autowired)
	private SellingUpdateMapper mapper;

	@Test
	public void testInsert() {
		ProductionVO vo = new ProductionVO();

		vo.setTitle("fTitle");
		vo.setPrice(1234);
		vo.setContent("setContnet");
		vo.setAddr("setAddr");
		vo.setPlace_pick("pick");
		vo.setP_quality("quality");
		vo.setCate_code("man");
		vo.setM_num(42);
		int result = mapper.insert(vo);

		log.info("¹¹°¡ ³Ñ¾î¿È ? : " + vo.getPro_num());

	}

}
