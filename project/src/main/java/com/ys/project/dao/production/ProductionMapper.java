package com.ys.project.dao.production;

import java.util.List;

import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.projectDTO.ProMemberJoinDTO;
import com.ys.project.projectVO.Production_uploadVO;

public interface ProductionMapper {

	// 인덱스 대표사진 표기 !!!
	public List<IndexProductionDTO> productionJoin();

	// 상품에 대한 업로드 정보 들고오기
	public List<Production_uploadVO> fineByPro(int pro_num);
	
	// 상품에 대한 맴버 조인
	public ProMemberJoinDTO proMemberJoin(int pro_num);
}
