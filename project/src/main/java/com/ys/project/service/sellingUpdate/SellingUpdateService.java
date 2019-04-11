package com.ys.project.service.sellingUpdate;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ys.project.dao.sellingUpdate.SellingUpdateMapper;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.service.member.PartnerService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SellingUpdateService implements ISellingUpdateService {

	private static final Logger log = LoggerFactory.getLogger(PartnerService.class);
	
	private SellingUpdateMapper mapper;

	// 파트너 선택
	@Override
	public List<PartnerVO> directPickList() {
		// TODO Auto-generated method stub
		return mapper.directPickList();
	}

}
