package com.aht.dao.upload;

import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

import com.aht.domain.relationship.Upload;

public class UploadDAOImpl {
	private Session session;
	
	public UploadDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}
	
	public void create(Upload upload) {
		session.save(upload);
	}
}
