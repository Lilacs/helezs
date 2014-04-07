package com.helezs.action.cases;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller("casesTextAction")
@Scope("prototype")
public class CasesTextAction {
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	@RequestMapping(value = "/casesText", method = RequestMethod.GET)
	public ModelAndView casesText(String id) {
		Writings writings = manageWritingsDAO.searchWritingsWithId(id);
		ModelAndView mv = new ModelAndView("cases/casesText");
		mv.addObject("writings", writings);
		mv.addObject("content", writings.getContent().getValue());
		// 增加阅读次数
		writings.setCount(writings.getCount() + 1);
		manageWritingsDAO.updateWritings(writings);
		return mv;
	}
}
