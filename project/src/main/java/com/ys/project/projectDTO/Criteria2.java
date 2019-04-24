package com.ys.project.projectDTO;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria2 {

	private int pageNum; // 현제 페이지
	private int amount; //보여줄 페이지 양

	private String type;
	private String keyword;

	public Criteria2() {
		this(1, 6);
	}

	public Criteria2(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		// TODO Auto-generated method stub

		return this.type == null ? new String[] {} : type.split("");

	}

	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount()).queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();

	}

}
