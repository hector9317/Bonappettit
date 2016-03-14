package com.aht.dao.click;

import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

import com.aht.domain.relationship.Click;

public class ClickDAOImpl {
	private Session session;
	
	public ClickDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}
	
	public void create(Click click) {
		session.save(click);
	}
}
