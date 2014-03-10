package com.helezs.action.cases;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller("casesTextAction")
@Scope("prototype")
public class CasesTextAction {
	private String id;
	private Writings writings;
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	@RequestMapping(value = "/casesText", method = RequestMethod.GET)
	public String casesText() {
		writings = manageWritingsDAO.searchWritingsWithId(id);
		return "cases/casesText";
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
