package com.ys.project.service.sellingUpdate;

import java.util.List;

import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionVO;

public interface ISellingUpdateService {

	// 파트너 선택
	public List<PartnerVO> directPickList();

	// 상품 등록
	public void insert(ProductionVO productionVO);

}
