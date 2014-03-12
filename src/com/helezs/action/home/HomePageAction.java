package com.helezs.action.home;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller("homePageAction")
@Scope("prototype")
public class HomePageAction {
	@Resource
	private ManageWritingsDAO manageWritingsDAO;
	private List<Writings> lw;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		try {
			lw = manageWritingsDAO.searchWritings();
		} catch (Exception e) {
			e.printStackTrace();
			lw = null;
		}
		return "home/home";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		try {
			lw = manageWritingsDAO.searchWritings();
		} catch (Exception e) {
			e.printStackTrace();
			lw = null;
		}
		return "home/home";
	}

	public List<Writings> getLw() {
		return lw;
	}

	public void setLw(List<Writings> lw) {
		this.lw = lw;
	}

}
