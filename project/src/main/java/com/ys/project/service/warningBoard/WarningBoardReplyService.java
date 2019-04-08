package com.ys.project.service.warningBoard;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ys.project.dao.warningBoard.ReplyMapper;
import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectDTO.ReplyPageDTO;
import com.ys.project.projectVO.WarningBoardReplyVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class WarningBoardReplyService implements IWarningBoardReplyService {

	private ReplyMapper mapper;

	@Override
	public int insert(WarningBoardReplyVO vo) {
		// TODO Auto-generated method stub

		return mapper.insert(vo);

	}

	@Override
	public WarningBoardReplyVO read(int reply_num) {
		// TODO Auto-generated method stub
		 return mapper.read(reply_num);
	}

	@Override
	public int delete(int reply_num) {
		// TODO Auto-generated method stub
		return mapper.delete(reply_num);
	}

	@Override
	public int update(WarningBoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public ReplyPageDTO getListWithPagin(Criteria cri, int wa_num) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(mapper.getCount(wa_num), mapper.getListWithPagin(cri, wa_num));
	}

}
