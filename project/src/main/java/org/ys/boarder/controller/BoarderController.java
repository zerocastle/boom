package org.ys.boarder.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.ys.boarder.domain.BoarderVO;
import org.ys.boarder.service.IBoarderService;

@Controller
@RequestMapping("boarder")
public class BoarderController {

	private static final Logger logger = LoggerFactory.getLogger(BoarderController.class);

	@Autowired
	private IBoarderService service;

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public void insert(BoarderVO board, Model model, RedirectAttributes re) throws Exception {
		logger.info("¿Œº≠∆Æ");
		logger.info(board.toString());
		
	}

	@RequestMapping(value = "selectListAll", method = RequestMethod.GET)
	public String showList(Model model) throws Exception {
		
		return "listPage";
	}

}
