package com.helezs.action.cases;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller("casesPageAction")
@Scope("prototype")
public class CasesPageAction {
	private List<Writings> decorationCaseWritings;
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	@RequestMapping(value = "/cases", method = RequestMethod.GET)
	public ModelAndView cases() {
		// 按照分类查询(装修案例)
		decorationCaseWritings = manageWritingsDAO
				.searchWritingsByClassification("decorationCase");
		ModelAndView mv = new ModelAndView("cases/cases");
		mv.addObject("decorationCaseWritings",decorationCaseWritings);
		return mv;
	}

	public List<Writings> getDecorationCaseWritings() {
		return decorationCaseWritings;
	}

	public void setDecorationCaseWritings(List<Writings> decorationCaseWritings) {
		this.decorationCaseWritings = decorationCaseWritings;
	}

}
