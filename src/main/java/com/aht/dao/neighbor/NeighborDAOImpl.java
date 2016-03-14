package com.aht.dao.neighbor;

import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

import com.aht.domain.relationship.Neighbor;

public class NeighborDAOImpl {
	private Session session;
	
	public NeighborDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}
	
	public void create(Neighbor neighbor) {
		session.save(neighbor);
	}
}
