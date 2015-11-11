package com.example.dao.counter;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import com.example.model.Counter;

public class CounterDAOImpl implements CounterDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Counter retrieve() {
		Counter counter = null;
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		counter = (Counter) session.get(Counter.class, 1);
		tx.commit();
		return counter;
	}

	public void update() {
		Counter counter = null;
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		counter = (Counter) session.get(Counter.class, 1);
		counter.setTotal(counter.getTotal() + 1);
		session.saveOrUpdate(counter);
		tx.commit();
	}
}
