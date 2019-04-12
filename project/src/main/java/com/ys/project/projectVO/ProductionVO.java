package com.ys.project.projectVO;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductionVO {

	private int pro_num;
	private String title;
	private int price;
	private String content;
	private Date create_date;
	private String addr;
	private String place_pick; // 직플 레이스 선정 default null
	private int chat_room_count; // 체팅방 요청이 오면 한개씩 증가
	private String p_quality; // 상품에 대한 퀄리티
	private String state_msg; // 상태 메세지
	private int place_signal; // 직플레이스 신호 신호는 1.0 으로 판단 1이면 직플레이스 거래를 희망

	private String cate_code; // 상품에 대한 카테고리
	private int m_num; // 회원에 대한 포린키

	// 업로드 된 객체에대한 정보를 담아두는 어레이 리스트
	private List<Production_uploadVO> uploadVOList;

}
