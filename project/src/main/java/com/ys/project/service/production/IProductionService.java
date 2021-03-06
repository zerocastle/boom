package com.ys.project.service.production;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ys.project.projectDTO.Criteria3;
import com.ys.project.projectDTO.IndexProductionDTO;

public interface IProductionService {

	// 인덱스 대표사진 표기 !!!
	public List<IndexProductionDTO> productionJoin();

	// 상품 상세 보기 mapper에 두개의 메소드를 하나로 통합
	public List<Map<String, Object>> totalFineByPro(int pro_num);

	// 상품 리스트별로 출력
	public List<IndexProductionDTO> productionListJoin(String cate_code);

	// 상품 리스트 정렬
	public List<IndexProductionDTO> sort(@Param("order") String order,
			@org.apache.ibatis.annotations.Param("cate_code") String cate_code,
			@org.apache.ibatis.annotations.Param("pageNum") int pageNum,
			@org.apache.ibatis.annotations.Param("amount") int amount);

	// 상품 갯수 들고오기
	public int getTotalCount(String cate_code);

	// 검색 상품 리스트 정렬
	public List<IndexProductionDTO> searchSort(Criteria3 cri3);

	// 검색 토탈 카운트
	public int searchGetTotalCount(@Param("type") String type, @Param("keyword") String keyword);

	// 앱 상품 인덱스 리스트 불러오기
	public List<IndexProductionDTO> appSort(@Param("order") String order,
			@org.apache.ibatis.annotations.Param("cate_code") String cate_code);
	
	//앱 상품 검색
	public List<IndexProductionDTO> appSearch(@Param("keyword") String keyword);

	// total 카테고리
	public List<Map<String, Integer>> cateCount();

}
