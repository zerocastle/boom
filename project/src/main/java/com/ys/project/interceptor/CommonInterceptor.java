package com.ys.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stud
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginSession") == null) {
			System.out.println("loginSession : null");
			request.setAttribute("loginDo", "1");
			response.sendRedirect("/");
			return false;
		}
		else {
			System.out.println("로그인 세션 있음");
			return true;
		}
	}

}
