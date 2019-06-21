package com.ys.project.service.sellingUpdate;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ys.project.projectDTO.MemberProductionList;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.PaymentVO;
import com.ys.project.projectVO.ProductionVO;

public interface ISellingUpdateService {

	// 파트너 선택
	public List<PartnerVO> directPickList();

	// 파트너창에서 검색
	public List<PartnerVO> directPickListSearch(@Param("choose") String choose, @Param("keyword") String keyword);

	// 상품 등록
	public void insert(ProductionVO productionVO);

	// 맴버에 대한 상품 관리
	public List<MemberProductionList> getMemberProductionList(Map map);

	// 맴버에 대한 총 상품 갯수
	public int getMemberProductionTotalCount(int m_num);

	// 상품 결제에 대한 리스트 불러오기
	public List<PaymentVO> getMemberPayment(@Param("nickname") String nickname);

	// 상품 결제 취소에 대한 처리
	public int refuseDelete(@Param("imp_uid") String imp_uid);

}
