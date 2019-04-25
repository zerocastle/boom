package com.ys.project.service.production;

import java.util.List;
import java.util.Map;

import com.ys.project.projectDTO.IndexProductionDTO;

public interface IProductionService {

	// 인덱스 대표사진 표기 !!!
	public List<IndexProductionDTO> productionJoin();
	
	
	// 상품 상세 보기 mapper에 두개의 메소드를 하나로 통합
	public List<Map<String,Object>> totalFineByPro(int pro_num);	
	
//	// 상품에 대한 업로드 정보 들고오기
//	public List<Production_uploadVO> fineByPro(int pro_num);
//
//	// 상품에 대한 맴버 조인
//	public ProMemberJoinDTO proMemberJoin(int pro_num);

}
