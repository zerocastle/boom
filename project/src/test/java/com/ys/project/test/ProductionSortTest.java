package com.ys.project.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ys.project.dao.production.ProductionMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
@Log4j
public class ProductionSortTest {
	
	@Autowired
	private ProductionMapper mapper;
	
	@Test
	public void test() {
		
		String order = "asc";
		String cate_code = "man";
		int pageNum = 1;
		int amount = 12;
		mapper.sort(order,cate_code, pageNum, amount);
	}
	
	

}
