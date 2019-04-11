package com.ys.project.dao.sellingUpdate;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ys.project.projectVO.PartnerVO;

public interface SellingUpdateMapper {
	
	// 파트너 선택
	public List<PartnerVO> directPickList();

}
