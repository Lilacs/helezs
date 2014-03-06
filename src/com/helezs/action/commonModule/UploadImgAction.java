package com.helezs.action.commonModule;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller("uploadImgAction")
@Scope("prototype")
public class UploadImgAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	public String index() {
		System.out.println("-----------------------------");
		return "success";
	}

}