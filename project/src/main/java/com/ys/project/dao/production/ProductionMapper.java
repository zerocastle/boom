package com.ys.project.dao.production;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

	// 인덱스 상품에서 주석 처리 대상
	public List<IndexProductionDTO> productionListJoin(String cate_code);

	// 상품 리스트 정렬
	public List<IndexProductionDTO> sort(@Param("order") String order,
			@org.apache.ibatis.annotations.Param("cate_code") String cate_code,
			@org.apache.ibatis.annotations.Param("pageNum") int pageNum,
			@org.apache.ibatis.annotations.Param("amount") int amount);

	// 상품 갯수 들고오기
	public int getTotalCount(@Param("cate_code") String cate_code);

	// 앱 상품 서비스 맵퍼
	public List<IndexProductionDTO> appSort(@Param("order") String order, @Param("cate_code") String cate_code);

	// 검색 상품 리스트 맵퍼
	public List<IndexProductionDTO> searchSort(@Param("pageNum") int pageNum,
			@org.apache.ibatis.annotations.Param("perPage") int perPage,
			@org.apache.ibatis.annotations.Param("choose") String choose);

}
