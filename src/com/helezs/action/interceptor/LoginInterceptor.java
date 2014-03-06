package com.helezs.action.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
/**
 * 登录验证拦截器
 * 
 * @author lilacs
 * 方法作用：
 * 	验证用户是否登录，作用于网站管理模块，如果用户没有登录则无法进行管理操作，跳转到登录页面
 */
public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		ActionContext ac = arg0.getInvocationContext();
		if ( true == ((boolean) ac.getSession().get("isLogin"))) {
			arg0.invoke();
		}
		
		return "error";
	}

}
