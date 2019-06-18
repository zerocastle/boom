package com.ys.project.projectVO;

import lombok.Data;

@Data
public class PartnerVO {
   private String uuid;
   private String uploadPath;
   private String fileName;
   private String company_number;
   private String part_name;
   private String boss_name;
   private String part_phone;
   private String zip_code; // 우편번호
   private String road_name; // 도로주소
   private String addr; // 지번주소
   private String detail_addr; // 상세주소
   private java.util.Date reg_date;
   private String lag; // 위도
   private String lng; // 경도
   private int m_num; // 회원 포린키
}