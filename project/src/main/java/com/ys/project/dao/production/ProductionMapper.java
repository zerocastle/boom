package com.ys.project.dao.production;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ys.project.projectDTO.IndexProductionDTO;
import com.ys.project.projectDTO.ProMemberJoinDTO;
import com.ys.project.projectVO.Production_uploadVO;

public interface ProductionMapper {

	// �ε��� ��ǥ���� ǥ�� !!!
	public List<IndexProductionDTO> productionJoin();

	// ��ǰ�� ���� ���ε� ���� ������
	public List<Production_uploadVO> fineByPro(int pro_num);

	// ��ǰ�� ���� �ɹ� ����
	public ProMemberJoinDTO proMemberJoin(int pro_num);

	// �ε��� ��ǰ���� �ּ� ó�� ���
	public List<IndexProductionDTO> productionListJoin(String cate_code);

	// ��ǰ ����Ʈ ����
	public List<IndexProductionDTO> sort(@Param("order") String order,
			@org.apache.ibatis.annotations.Param("cate_code") String cate_code,
			@org.apache.ibatis.annotations.Param("pageNum") int pageNum,
			@org.apache.ibatis.annotations.Param("amount") int amount);

	// ��ǰ ���� ������
	public int getTotalCount(@Param("cate_code") String cate_code);

	// �� ��ǰ ���� ����
	public List<IndexProductionDTO> appSort(
			@Param("order") String order,
			@Param("cate_code") String cate_code);

}
