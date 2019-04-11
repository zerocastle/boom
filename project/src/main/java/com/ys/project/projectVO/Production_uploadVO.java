package com.ys.project.projectVO;

import lombok.Data;

@Data
public class Production_uploadVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private String folder;
	private boolean image;

	private int pro_num; // 상품에 대한 포린키

}
