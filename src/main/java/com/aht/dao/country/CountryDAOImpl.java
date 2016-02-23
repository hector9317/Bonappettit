package com.aht.dao.country;

import java.util.LinkedList;
import com.aht.model.Country;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CountryDAOImpl implements CountryDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public LinkedList<Country> retrieveAll() {
		LinkedList<Country> countries = null;
		Session session = this.sessionFactory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		countries = new LinkedList<Country>(session.createQuery("from Country country order by country.name asc").list());
		System.out.println("-----------> countries: " + countries.size());
		transaction.commit();
		return countries;
	}

}
