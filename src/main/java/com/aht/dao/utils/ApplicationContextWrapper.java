package com.aht.dao.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextWrapper {
	private static ApplicationContext INSTANTIATED = null;
	
	private ApplicationContextWrapper() { }
	
	public static ApplicationContext getInstance() {
		if(INSTANTIATED == null)
			INSTANTIATED = new ClassPathXmlApplicationContext("config.xml");
		return INSTANTIATED;
	}
}
