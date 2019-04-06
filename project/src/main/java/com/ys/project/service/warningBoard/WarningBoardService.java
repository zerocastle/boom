package com.ys.project.service.warningBoard;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ys.project.dao.warningBoard.WarningBoardMapper;
import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.WarningBoardVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WarningBoardService implements IWarningBoardService {

	private static final Logger log = LoggerFactory.getLogger(WarningBoardService.class);

	private WarningBoardMapper mapper;

	@Override
	public void register(WarningBoardVO warningBoardVO) {
		// TODO Auto-generated method stub

		mapper.insert(warningBoardVO);

	}

	@Override
	public WarningBoardVO get(long wa_num) {
		// TODO Auto-generated method stub
		return mapper.read(wa_num);
	}

	@Override
	public boolean modify(WarningBoardVO warningBoardVO) {
		// TODO Auto-generated method stub
		return mapper.update(warningBoardVO) == 1;
	}

	@Override
	public boolean remove(long wa_num) {
		// TODO Auto-generated method stub
		return mapper.delete(wa_num) == 1;
	}

	@Override
	public List<WarningBoardVO> getListWithPagin(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPagin(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	

}
