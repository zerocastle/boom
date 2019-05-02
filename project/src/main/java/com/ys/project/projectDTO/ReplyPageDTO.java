package com.ys.project.projectDTO;

import java.util.List;

import com.ys.project.projectVO.WarningBoardReplyVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {

	private int replyCnt;
	private List<WarningBoardReplyVO> list;

}
