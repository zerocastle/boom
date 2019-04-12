package com.ys.project.dao.sellingUpdate;

import java.util.List;

import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionVO;

public interface SellingUpdateMapper {

	// 파트너 선택
	public List<PartnerVO> directPickList();

	// 상품 등록
	public int insert(ProductionVO productionVO);

	

}
