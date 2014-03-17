package com.helezs.action.commonModule;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction {
	private static Properties prop = new Properties();
	static {
		try {
			prop.load(LoginAction.class.getClassLoader().getResourceAsStream(
					"com/helezs/action/commonModule/user.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		String isLogin = (String)request.getSession().getAttribute("user");
		if("1".equals(isLogin)){
			return "redirect:/manageIndex";
		}else{
			return "manageItem/login";
		}
	}

	@RequestMapping(value = "checkUser", method = RequestMethod.POST)
	@ResponseBody
	public String checkUser(String user, String pwd,
			HttpServletRequest request, HttpServletResponse response) {
		String passwordSent = this.toMD5(pwd);
		// 获取原始用户数据
		String localUser = prop.getProperty("username");
		String localPwd = prop.getProperty("pwd");
		if(localUser.equals(user) && localPwd.equals(passwordSent)){
			request.getSession().setAttribute("user", "1");
			return "true";
		}else{
			return "";
		}
	}

	public String toMD5(String plainText) {
		try {
			// 生成实现指定摘要算法的 MessageDigest 对象。
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 使用指定的字节数组更新摘要。
			md.update(plainText.getBytes());
			// 通过执行诸如填充之类的最终操作完成哈希计算。
			byte b[] = md.digest();
			// 生成具体的md5密码到buf数组
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			System.out.println("32位: " + buf.toString());// 32位的加密
			System.out.println("16位: " + buf.toString().substring(8, 24));// 16位的加密，其实就是32位加密后的截取
			return buf.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
