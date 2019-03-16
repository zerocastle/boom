package com.ys.project.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/root-context.xml" })
public class TestURI {
	private static final Logger Logger = org.slf4j.LoggerFactory.getLogger(TestURI.class);

	@Test
	public void test() throws Exception {
		UriComponents uriComponent = UriComponentsBuilder.newInstance().path("/board/read").queryParam("bno", 23)
				.queryParam("perPageNum", 10).build();
		Logger.info("/board/read?bno=23&perPageNum=10");
		Logger.info(uriComponent.toString());
	}

}
