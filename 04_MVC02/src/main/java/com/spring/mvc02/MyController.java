package com.spring.mvc02;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {
	
    @RequestMapping("/input")
    public String input() {
        return "insertForm";
    }
    
    @RequestMapping("/inputOk")
    public String abc(HttpServletRequest request, Model model) {

        // 여기가 서블릿이라고 생각하면 됨
        String user_name = request.getParameter("name").trim();
        String user_age = request.getParameter("age").trim();
        String user_phone = request.getParameter("phone").trim();

        // 폼 창에서 넘어온 정보를 받아서 뷰 페이지로 넘겨주는 작업 
        model.addAttribute("userName", user_name);
        model.addAttribute("userAge", user_age);
        model.addAttribute("userPhone", user_phone);
        
		return "inputResult";
    }
    
    @RequestMapping("/login")
    public String login() {    	
    	return "loginForm";
    }
    
    // @RequestParam => request.getParameter
    // String user_name = request.getParameter("userId") => 
    // @RequestParam("userId") String user_id
    @RequestMapping("/loginOk")
    public String loginOk(@RequestParam("userId") String user_id, @RequestParam("userPwd") String user_pwd, Model model) {    	
    	model.addAttribute("id", user_id);
    	model.addAttribute("pwd", user_pwd);
    	return "result";
    }

}
