package com.helezs.action.events;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("eventsPageAction")
@Scope("prototype")
public class EventsPageAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@RequestMapping(value = "/events", method = RequestMethod.GET)
	public String events() {
		return "events/events";
	}
}
