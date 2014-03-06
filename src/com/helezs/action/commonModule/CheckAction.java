package com.helezs.action.commonModule;

import java.util.Properties;

import com.helezs.util.BaseAware;
import com.helezs.util.CommonIdentity;

public class CheckAction extends BaseAware{
	private String username;
	private String pwd;
	
	public String execute(){
		Properties pro = new Properties();
		try{
			pro.load(CheckAction.class.getClassLoader().getResourceAsStream("com/helezs/action/commonModule/user.properties"));
			
		}catch(Exception e){
			e.printStackTrace();
			return CommonIdentity.QUERY_EXCEPTION;
		}
		String _username = pro.getProperty("username");
		String _pwd = pro.getProperty("pwd");
		if(_username.equals(username)){
			if(_pwd.equals(pwd)){
				this.session.put("isLogin", true);
				return "success";
			}else{
				return CommonIdentity.ACCOUNT_ERROR;
			}
		}else{
			return CommonIdentity.ACCOUNT_ERROR;
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
