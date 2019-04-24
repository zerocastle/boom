package com.ys.project.dao.sellingUpdate;

import java.util.List;
import java.util.Map;

import com.ys.project.projectDTO.MemberProductionList;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionVO;

public interface SellingUpdateMapper {

	// 파트너 선택
	public List<PartnerVO> directPickList();

	// 상품 등록
	public int insert(ProductionVO productionVO);

	// 맴버에 대한 상품 관리
	public List<MemberProductionList> getMemberProductionList(Map map);
	
	// 맴버에 대한 총 상품 갯수
	public int getMemberProductionTotalCount(int m_num);

}
