package com.ys.project.service.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ys.project.dao.admin.NoticeBoardMapper;
import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.NoticeBoardVO;
import com.ys.project.projectVO.UserListVO;
import com.ys.project.projectVO.buyListVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class NoticeBoardServiceImple implements INoticeBoardService {

	private static final Logger log = LoggerFactory.getLogger(NoticeBoardServiceImple.class);

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardMapper mapper;

	@Override
	public void register(NoticeBoardVO board) {
		// TODO Auto-generated method stub
		log.info("register..." + board);
		mapper.insert(board);
	}

	@Override
	public NoticeBoardVO get(long bno) {
		// TODO Auto-generated method stub
		log.info("상세보기");
		return mapper.read(bno);

	}

	@Override
	public boolean modify(NoticeBoardVO board) {
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

	// 리스트 페이징
	@Override
	public List<NoticeBoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("페이징 리스트 ~~" + cri);
		return mapper.getlistWithPagin(cri);
	}

	// 내 게시물 들고오기
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		log.info("토탈 카운터 : " + mapper.getTotalCount());
		return mapper.getTotalCount();
	}

//	@Override
//	public List<NoticeBoard> getList() {
//		// TODO Auto-generated method stub
//		log.info("getList");
//		System.out.println(mapper.getList());
//		return mapper.getList();
//	}
	
	   @Override
	   public List<buyListVO> buy(){
	      return mapper.buy();
	   }
	   
	   @Override
	   public List<UserListVO>User(){
	      return mapper.User();
	   }
	   

}
