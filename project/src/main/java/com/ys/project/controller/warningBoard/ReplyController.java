package com.ys.project.controller.warningBoard;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ys.project.projectDTO.Criteria;
import com.ys.project.projectVO.WarningBoardReplyVO;
import com.ys.project.service.warningBoard.WarningBoardReplyService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/replies")
public class ReplyController {
	private static final Logger log = LoggerFactory.getLogger(ReplyController.class);

	private WarningBoardReplyService service;

	// 댓글 달기
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody WarningBoardReplyVO vo) {
		
		log.info("/new 넌 뭘로 변해서 온거니 ??" + vo);

		int insertCount = service.insert(vo);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	// 댓글 리스트 불러오기 페이징 처리
	@GetMapping(value = "/pages/{wa_num}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<WarningBoardReplyVO>> getList(@PathVariable("page") int page,
			@PathVariable("wa_num") int wa_num) {

		Criteria cri = new Criteria(page, 10); // 임시 카운트

		return new ResponseEntity<List<WarningBoardReplyVO>>(service.getListWithPagin(cri, wa_num), HttpStatus.OK);

	}

	// 상세보기
	@GetMapping(value = "/{reply_num}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<WarningBoardReplyVO> get(@PathVariable("reply_num") int reply_num) {

		return new ResponseEntity<WarningBoardReplyVO>(service.read(reply_num), HttpStatus.OK);

	}

	// 댓글 삭제
	@DeleteMapping(value = "/{reply_num}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("reply_num") int reply_num) {

		return service.delete(reply_num) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	// 댓글 수정
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{reply_num}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody WarningBoardReplyVO vo,
			@PathVariable("reply_num") int reply_num) {

		vo.setReply_num(reply_num);

		log.info("reply_num " + reply_num);

		return service.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

}
