package com.ys.project.dao.productionUpload;

import java.util.List;

import com.ys.project.projectVO.ProductionVO;
import com.ys.project.projectVO.Production_uploadVO;

public interface ProductionUploadMapper {

	// 파일 업로드
	public void insertUpload(Production_uploadVO upload);
	
	// 업로드 된 삭제
	public void delete(String uuid);
	
	// 게시물에대한 업로드 파일 찾기
	public List<ProductionVO> fineByPro(int pro_num);
	
	// 이미지 뿌려주기 위한 
	/* public List<ProductionVO> indexProduct */
	
	
}
