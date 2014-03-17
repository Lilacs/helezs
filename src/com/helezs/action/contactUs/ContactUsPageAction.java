package com.helezs.action.contactUs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller("contactUsPageAction")
@Scope("prototype")
public class ContactUsPageAction {
	@Resource
	private ManageWritingsDAO manageWritingsDAO;

	@RequestMapping(value = "/contactUs", method = RequestMethod.GET)
	public ModelAndView contactUs() {
		List<Writings> lw = manageWritingsDAO.searchWritingsByClassification("contact");
		ModelAndView mv = new ModelAndView("contactUs/contactUs");
		//为了省事,这个文章中只有一条.
		if(lw.size() != 0){
			mv.addObject("contactUs", lw.get(0));
		}
		return mv;
	}
}
