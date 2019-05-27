package com.ys.project.service.production;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ys.project.projectDTO.IndexProductionDTO;

public interface IProductionService {

	// �ε��� ��ǥ���� ǥ�� !!!
	public List<IndexProductionDTO> productionJoin();
	
	
	// ��ǰ �� ���� mapper�� �ΰ��� �޼ҵ带 �ϳ��� ����
	public List<Map<String,Object>> totalFineByPro(int pro_num);	
	
	
	// ��ǰ ����Ʈ���� ���
	public List<IndexProductionDTO> productionListJoin(String cate_code);
	
	// ��ǰ ����Ʈ ����
	public List<IndexProductionDTO> sort(@Param("order") String order,
				@org.apache.ibatis.annotations.Param("cate_code") String cate_code,
				@org.apache.ibatis.annotations.Param("pageNum") int pageNum,
				@org.apache.ibatis.annotations.Param("amount") int amount
				);
	// ��ǰ ���� ������
	public int getTotalCount(String cate_code);
	
	// �� ��ǰ �ε��� ����Ʈ �ҷ����� 
	public List<IndexProductionDTO> appSort(@Param("order") String order,
			@org.apache.ibatis.annotations.Param("cate_code") String cate_code
			);
	
	
	
	

}
