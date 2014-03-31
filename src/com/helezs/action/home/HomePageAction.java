package com.helezs.action.home;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller("homePageAction")
@Scope("prototype")
public class HomePageAction {
	@Resource
	private ManageWritingsDAO manageWritingsDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home() {
		List<Writings> lw = new ArrayList<Writings>();
 		try {
			lw = manageWritingsDAO.searchWritings();
		} catch (Exception e) {
			e.printStackTrace();
			lw = null;
		}
		ModelAndView mv = new ModelAndView("home/home");
		List<Writings> returnlw = new ArrayList<Writings>();
		for(Writings w : lw){
			String classification = w.getClassification();
			if(classification.equals("aboutUs") || classification.equals("designTeam") || classification.equals("decorationCase") || classification.equals("contact")){
				continue;
			}
			Writings writings = w;
			returnlw.add(writings);
		}
		mv.addObject("allData", returnlw);
		return mv;
	}

}
