package com.ys.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="member")
public class MemberController {
	
	@RequestMapping(value="login" , method=RequestMethod.GET)
	public void login(Model model) throws Exception {
		
	}

}
