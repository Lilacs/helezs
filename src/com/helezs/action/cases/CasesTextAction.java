package com.helezs.action.cases;

import javax.annotation.Resource;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

public class CasesTextAction {
	private String id;
	private Writings writings;
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	public String execute() {
		writings = manageWritingsDAO.searchWritingsWithId(id);
		return "success";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Writings getWritings() {
		return writings;
	}

	public void setWritings(Writings writings) {
		this.writings = writings;
	}

}
