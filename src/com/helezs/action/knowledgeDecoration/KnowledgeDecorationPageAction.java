package com.helezs.action.knowledgeDecoration;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("knowledgeDecorationPageAction")
@Scope("prototype")
public class KnowledgeDecorationPageAction {

	@RequestMapping(value = "/knowledgeDecoration", method = RequestMethod.GET)
	public String knowledgeDecoration() {
		return "knowledgeDecoration/knowledgeDecoration";
	}
}
