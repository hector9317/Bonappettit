package com.aht.dao.rate;

import org.neo4j.ogm.session.Session;
import com.aht.domain.relationship.Rate;
import org.neo4j.ogm.session.SessionFactory;

public class RateDAOImpl {
	private Session session;

	public RateDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}
	
	public void create(Rate rate) {
		session.save(rate);
	}
}
