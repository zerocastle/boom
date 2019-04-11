package com.ys.project.service.warningBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ys.project.dao.warningBoard.ReplyMapper;
import com.ys.project.dao.warningBoard.WarningBoardMapper;
import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectDTO.ReplyPageDTO;
import com.ys.project.projectVO.WarningBoardReplyVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class WarningBoardReplyService implements IWarningBoardReplyService {

	// 댓글 처리 하는 매퍼
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	// 게시판 처리하는 매퍼
	@Setter(onMethod_ = @Autowired)
	private WarningBoardMapper boardMapper;

	@Transactional
	@Override
	// 댓글을 입력했을때 댓글 입력된 숫자를 증가시키고 , 댓글을 입력한다.
	public int insert(WarningBoardReplyVO vo) {
		// TODO Auto-generated method stub

		boardMapper.updateReplyCnt(vo.getWa_num(), 1); // 댓글을 입력하면 cnt를 증가를 먼저 시킨뒤에 댓글을 입력을한다
		// 그렇기에 한개라도 실패를 하면 , 적용이 되지 않아야 하기 떄문에 @Trasactional 을 사용한다.
		return mapper.insert(vo);

	}

	@Transactional
	@Override
	// 댓글을 입력했을때 댓글단 숫자를 하나 떨어 뜨리고 , 댓글을 삭제한다.
	public int delete(int reply_num) {
		// TODO Auto-generated method stub
		WarningBoardReplyVO vo = mapper.read(reply_num);

		boardMapper.updateReplyCnt(vo.getWa_num(), -1);
		return mapper.delete(reply_num);
	}

	@Override
	public WarningBoardReplyVO read(int reply_num) {
		// TODO Auto-generated method stub
		return mapper.read(reply_num);
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
