package com.ys.project.service.warningBoard;

import java.util.List;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.WarningBoardVO;

public interface IWarningBoardService {

	public void register(WarningBoardVO warningBoardVO);

	public WarningBoardVO get(long wa_num);

	public boolean modify(WarningBoardVO warningBoardVO);

	public boolean remove(long wa_num);
	
	public List<WarningBoardVO> getListWithPagin(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	

}
