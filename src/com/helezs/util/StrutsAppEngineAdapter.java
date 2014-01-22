package com.helezs.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import ognl.OgnlRuntime;

public class StrutsAppEngineAdapter implements ServletContextListener {
	public void contextDestroyed(ServletContextEvent arg0) {
	}

	public void contextInitialized(ServletContextEvent arg0) {
		OgnlRuntime.setSecurityManager(null);
	}
}