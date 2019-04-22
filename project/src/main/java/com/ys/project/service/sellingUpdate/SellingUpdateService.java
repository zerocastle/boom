package com.ys.project.service.sellingUpdate;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ys.project.dao.productionUpload.ProductionUploadMapper;
import com.ys.project.dao.sellingUpdate.SellingUpdateMapper;
import com.ys.project.projectDTO.MemberProductionList;
import com.ys.project.projectVO.PartnerVO;
import com.ys.project.projectVO.ProductionVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class SellingUpdateService implements ISellingUpdateService {

	private static final Logger log = LoggerFactory.getLogger(SellingUpdateService.class);

	@Setter(onMethod_ = @Autowired)
	private SellingUpdateMapper sellingMapper;

	@Setter(onMethod_ = @Autowired)
	private ProductionUploadMapper uploadMapper;

	// 파트너 선택
	@Override
	public List<PartnerVO> directPickList() {
		// TODO Auto-generated method stub
		return sellingMapper.directPickList();
	}

	@Transactional
	@Override
	public void insert(ProductionVO productionVO) {
		// TODO Auto-generated method stub

		log.info("등록하기 ...." + productionVO);

		int result = sellingMapper.insert(productionVO);
		int pro_num = productionVO.getPro_num();
		log.info("상품 인선트 반환 값 프로 넘 : " + pro_num);
		if (productionVO.getUploadVOList() == null || productionVO.getUploadVOList().size() <= 0) {

			return;
		}
		// foreach 람다식
		productionVO.getUploadVOList().forEach(upload -> {
			upload.setPro_num(pro_num); // 가지고온 키값을 넣어준다.
			uploadMapper.insertUpload(upload);
		});

	}

	// 회원에 대한 상품 리스트 불러오기
	@Override
	public List<MemberProductionList> getMemberProductionList(int m_num) {
		// TODO Auto-generated method stub
		return sellingMapper.getMemberProductionList(m_num);
	}

}
