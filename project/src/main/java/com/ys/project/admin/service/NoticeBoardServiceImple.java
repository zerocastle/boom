package com.ys.project.admin.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ys.project.admin.mapper.NoticeBoardMapper;
import com.ys.project.memberVO.NoticeBoard;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class NoticeBoardServiceImple implements INoticeBoardService {

	private static final Logger log = LoggerFactory.getLogger(NoticeBoardServiceImple.class);

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardMapper mapper;

	@Override
	public void register(NoticeBoard board) {
		// TODO Auto-generated method stub
		log.info("register..." + board);
		mapper.insert(board);
	}

	@Override
	public NoticeBoard get(long bno) {
		// TODO Auto-generated method stub
		log.info("상세보기");
		return mapper.read(bno);

	}

	@Override
	public boolean modify(NoticeBoard board) {
		// TODO Auto-generated method stub
		log.info("수정하기");
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(long bno) {
		// TODO Auto-generated method stub
		log.info("삭제하기");
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<NoticeBoard> getList() {
		// TODO Auto-generated method stub
		log.info("getList");
		System.out.println(mapper.getList());
		return mapper.getList();
	}

}
