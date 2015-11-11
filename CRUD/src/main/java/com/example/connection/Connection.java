package com.example.connection;

import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

public class Connection {
	private static Connection connection = new Connection();
	private SessionFactory sessionFactory;
	private Session session;
	//SessionFactory sessionFactory = new SessionFactory("com.example.domain");
	//Session session = sessionFactory.openSession("http://localhost:7474", "neo4j", "burros93");
	
	private Connection() {
		this.sessionFactory = new SessionFactory("com.example.domain");
		this.session = sessionFactory.openSession("http://localhost:7474", "neo4j", "burros93");
	}
	
	public static Connection getConnection() {
		return connection;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

}
