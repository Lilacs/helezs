package com.helezs.action.home;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller
@Scope("prototype")
public class HomePageAction {
	@Resource
	private ManageWritingsDAO manageWritingsDAO;
	private List<Writings> lw;

	public String execute() {
		try{
			lw = manageWritingsDAO.searchWritings();
		}catch(Exception e){
			e.printStackTrace();
			lw = null;
		}
		return "success";
	}

	public List<Writings> getLw() {
		return lw;
	}

	public void setLw(List<Writings> lw) {
		this.lw = lw;
	}
	
}
