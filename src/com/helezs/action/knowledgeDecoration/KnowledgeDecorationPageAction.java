package com.helezs.action.knowledgeDecoration;

import java.util.ArrayList;
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

@Controller("knowledgeDecorationPageAction")
@Scope("prototype")
public class KnowledgeDecorationPageAction {
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	@RequestMapping(value = "/knowledgeDecoration", method = RequestMethod.GET)
	public ModelAndView knowledgeDecoration(HttpServletRequest request) {
		int pageNumber = 1;
		ModelAndView mv = new ModelAndView("knowledgeDecoration/knowledgeDecoration");
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		List<Writings> lw = manageWritingsDAO.PagingQueryByClassification(pageNumber, "knowledgeDecoration");
		int pageSize = manageWritingsDAO.countByClassification("knowledgeDecoration");
		mv.addObject("knowledgeDecoration", lw);
		mv.addObject("pageSize",pageSize);
		mv.addObject("page",pageNumber);
		return mv;
	}
	
	@RequestMapping(value = "/knowledgeDecorationText", method = RequestMethod.GET)
	public ModelAndView casesText(String id) {
		Writings writings = manageWritingsDAO.searchWritingsWithId(id);
		ModelAndView mv = new ModelAndView(
				"knowledgeDecoration/knowledgeDecorationText");
		mv.addObject("writings", writings);
		mv.addObject("content", writings.getContent().getValue());
		// 增加阅读次数
		writings.setCount(writings.getCount() + 1);
		manageWritingsDAO.updateWritings(writings);
		return mv;
	}
}
