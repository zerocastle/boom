package com.ys.project.projectDTO;

import lombok.Data;

//�ε����� �� ������ ���� �ѷ��ֱ� ���� ���

@Data
public class IndexProductionDTO {

	private int pro_num;
	private String title;
	private int price;
	private String cate_code;
	private int place_signal; // ���� ��� ����
	private String state_msg; // ���� �޽���
	private String uuid;
	private String uploadPath;
	private String fileName;
	private int rep;

}