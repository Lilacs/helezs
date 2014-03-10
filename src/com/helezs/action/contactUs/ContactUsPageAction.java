package com.helezs.action.contactUs;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("contactUsPageAction")
@Scope("prototype")
public class ContactUsPageAction {
	@RequestMapping(value = "/contactUs", method = RequestMethod.GET)
	public String contactUs() {
		return "contactUs/contactUs";
	}
}
