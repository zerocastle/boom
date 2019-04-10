package com.ys.project.service.warningBoard;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectDTO.ReplyPageDTO;
import com.ys.project.projectVO.WarningBoardReplyVO;

public interface IWarningBoardReplyService {

	public int insert(WarningBoardReplyVO vo);

	public WarningBoardReplyVO read(int reply_num);

	public int delete(int reply_num);

	public int update(WarningBoardReplyVO vo);

	public ReplyPageDTO getListWithPagin(Criteria cri, int wa_num);

}
