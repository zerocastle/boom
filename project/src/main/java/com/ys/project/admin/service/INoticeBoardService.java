package com.ys.project.admin.service;

import java.util.List;

import com.ys.project.memberVO.NoticeBoard;

public interface INoticeBoardService {

	public void register(NoticeBoard board);

	public NoticeBoard get(long bno);

	public boolean modify(NoticeBoard board);

	public boolean remove(long bno);

	public List<NoticeBoard> getList();

}
