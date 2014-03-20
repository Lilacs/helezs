package com.helezs.action.cases;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	@RequestMapping(value = "/cases", method = RequestMethod.GET)
	public ModelAndView cases(HttpServletRequest request) {
		// 按照分类查询(装修案例)
		int pageNumber = 1;
		ModelAndView mv = new ModelAndView("cases/cases");
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		List<Writings> lw = manageWritingsDAO.PagingQueryByClassification(pageNumber, "decorationCase");
		int pageSize = manageWritingsDAO.countByClassification("decorationCase");
		mv.addObject("decorationCaseWritings", lw);
		mv.addObject("pageSize",pageSize);
		mv.addObject("page",pageNumber);
		return mv;
	}
}
