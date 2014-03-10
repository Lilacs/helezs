package com.helezs.action.designTeam;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("designTeamPageAction")
@Scope("prototype")
public class DesignTeamPageAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@RequestMapping(value = "/designTeam", method = RequestMethod.GET)
	public String designTeam() {
		return "designTeam/designTeam";
	}
}
