package com.ys.project.dao.warningBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.WarningBoardReplyVO;

public interface ReplyMapper {

	public int insert(WarningBoardReplyVO vo);

	public WarningBoardReplyVO read(int reply_num);

	public int delete(int reply_num);

	public int update(WarningBoardReplyVO vo);

	
	public List<WarningBoardReplyVO> getListWithPagin(
			@Param("cri") Criteria cri,
			@Param("wa_num") int wa_num
			);
	
	public int getCount(int wa_num);

}
