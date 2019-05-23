package com.ys.project.service.production;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ys.project.dao.production.ProductionMapper;
import com.ys.project.projectDTO.Criteria3;
import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.projectDTO.ProMemberJoinDTO;
import com.ys.project.projectVO.Production_uploadVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductionService implements IProductionService {

	private static final Logger log = LoggerFactory.getLogger(ProductionService.class);

	private ProductionMapper mapper;

	@Override
	public List<IndexProductionDTO> productionJoin() {
		// TODO Auto-generated method stub
		return mapper.productionJoin();
	}

	@Transactional
	@Override
	// fineBYPro , proMemberJoin 통합 매서드 처리
	public List<Map<String, Object>> totalFineByPro(int pro_num) {
		// TODO Auto-generated method stub
		List<Production_uploadVO> fineByPro = mapper.fineByPro(pro_num);

		ProMemberJoinDTO proMemberJoin = mapper.proMemberJoin(pro_num);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("Production_uploadVO", fineByPro);

		map.put("ProMemberJoinDTO", proMemberJoin);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(map);

		log.info("너는 무엇 이니  ? " + list);

		return list;
	}

	// 상품 카테고리별 상품 출력

	@Override
	public List<IndexProductionDTO> productionListJoin(String cate_code) { // TODO Auto-generated method stub
																			// log.info("상품 리스트 별로 출력");
		return mapper.productionListJoin(cate_code);
	}

	@Override
	public List<IndexProductionDTO> sort(String order, String cate_code, int pageNum, int amount) {
		// TODO Auto-generated method stub
		return mapper.sort(order, cate_code, pageNum, amount);
	}

	@Override
	public int getTotalCount(String cate_code) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cate_code);
	}

	
	//앱 상품 서비스 
	@Override
	public List<IndexProductionDTO> appSort(String order, String cate_code) {
		// TODO Auto-generated method stub
		return mapper.appSort(order, cate_code);
	}

	
	// 검색 서비스
	@Override
	public List<IndexProductionDTO> searchSort(Criteria3 cri3) {
		// TODO Auto-generated method stub
		return mapper.searchSort(cri3);
	}

	@Override
	public int searchGetTotalCount(String type, String keyword) {
		// TODO Auto-generated method stub
		return mapper.searchGetTotalCount(type, keyword);
	}


}
