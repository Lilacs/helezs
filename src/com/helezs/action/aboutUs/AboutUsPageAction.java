package com.helezs.action.aboutUs;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("aboutUsPageAction")
@Scope("prototype")
public class AboutUsPageAction {

	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public String aboutUs() {
		return "aboutUs/aboutUs";
	}
}
