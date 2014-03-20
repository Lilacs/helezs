package com.helezs.action.events;

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

@Controller("eventsPageAction")
@Scope("prototype")
public class EventsPageAction {
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public ModelAndView events(HttpServletRequest request) {
		int pageNumber = 1;
		ModelAndView mv = new ModelAndView("events/events");
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		List<Writings> lw = manageWritingsDAO.PagingQueryByClassification(pageNumber, "events");
		int pageSize = manageWritingsDAO.countByClassification("events");
		mv.addObject("events", lw);
		mv.addObject("pageSize",pageSize);
		mv.addObject("page",pageNumber);
		return mv;
	}

	@RequestMapping(value = "/eventsText", method = RequestMethod.GET)
	public ModelAndView casesText(String id) {
		Writings writings = manageWritingsDAO.searchWritingsWithId(id);
		ModelAndView mv = new ModelAndView("events/eventsText");
		// 增加阅读次数
		writings.setCount(writings.getCount() + 1);
		manageWritingsDAO.updateWritings(writings);
		mv.addObject("writings", writings);
		return mv;
	}
}
