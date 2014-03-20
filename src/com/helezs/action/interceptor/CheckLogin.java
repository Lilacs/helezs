package com.helezs.action.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor; 
import org.springframework.web.servlet.ModelAndView;
public class CheckLogin implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("---------after---------");
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView modelAndView) throws Exception {
		System.out.println("---------post---------");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		String user = (String) request.getSession().getAttribute("user");
		if("1".equals(user)){
			System.out.println("---------user is 1--");
			return true;
		}else{
			request.getRequestDispatcher("/login").forward(request, response);
			return false;
		}
	}

}
