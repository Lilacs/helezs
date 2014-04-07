package com.helezs.action.aboutUs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller("aboutUsPageAction")
@Scope("prototype")
public class AboutUsPageAction {
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public ModelAndView aboutUs() {
		List<Writings> lw = manageWritingsDAO.searchWritingsByClassification("aboutUs");
		ModelAndView mv = new ModelAndView("aboutUs/aboutUs");
		//为了省事,这个文章中只有一条.
		if(lw.size() != 0){
			mv.addObject("aboutUs", lw.get(0));
			mv.addObject("content", lw.get(0).getContent().getValue());
		}
		return mv;
	}
}
