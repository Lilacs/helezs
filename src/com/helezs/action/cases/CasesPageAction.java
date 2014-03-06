package com.helezs.action.cases;

import java.util.List;

import javax.annotation.Resource;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

public class CasesPageAction {
	private List<Writings> decorationCaseWritings;
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	public String execute() {
		//按照分类查询(装修案例)
		decorationCaseWritings = manageWritingsDAO.searchWritingsByClassification("decorationCase");
		return "success";
	}

	public List<Writings> getDecorationCaseWritings() {
		return decorationCaseWritings;
	}

	public void setDecorationCaseWritings(List<Writings> decorationCaseWritings) {
		this.decorationCaseWritings = decorationCaseWritings;
	}

	

}
