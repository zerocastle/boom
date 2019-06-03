package com.ys.project.projectVO;

import lombok.Data;

@Data
public class AppPartnerVO {
   
   private String nickname;
   private String company_number;
   private String part_name;
   private String boss_name;
   private String part_phone;
   private String zip_code; // ������ȣ
   private String road_name; // �����ּ�
   private String addr; // �����ּ�
   private String detail_addr; // ���ּ�
   private java.util.Date reg_date;
   private String lag; // ����
   private String lng; // �浵
   private int m_num; // ȸ�� ����Ű
}