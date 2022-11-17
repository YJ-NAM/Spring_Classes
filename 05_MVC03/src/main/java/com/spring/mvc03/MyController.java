package com.spring.mvc03;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
	
	// 매개변수로 Member member 넣어주면 자동으로 Member 객체에 있는 애들을 다 받아줌
	@RequestMapping("/join_ok")
	public String joinOk(Member member, Model model) {
		model.addAttribute("Member", member);
		
		return "joinInfo";		
	}

}
