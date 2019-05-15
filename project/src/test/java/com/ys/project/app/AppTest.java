package com.ys.project.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ys.project.service.production.IProductionService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
@Log4j
public class AppTest {

	@Autowired
	IProductionService service;

	@Test
	public void productionTest() {

		String order = "desc";
//		String cate_code = "man";
		String cate_code = null;
		service.appSort(order, cate_code);

	}

}
