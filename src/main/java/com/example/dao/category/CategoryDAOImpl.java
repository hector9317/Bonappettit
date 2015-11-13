package com.example.dao.category;

import java.util.LinkedList;
import com.example.domain.Category;
import com.example.model.Counter;
import com.example.connection.Connection;
import com.example.dao.counter.CounterDAOImpl;

import org.neo4j.ogm.session.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CategoryDAOImpl implements CategoryDAO {
	private Session session;
	
	public CategoryDAOImpl() {
    	Connection connection = Connection.getConnection();
    	this.session = connection.getSession();
	}
	
	public void create(Category category) {
		CounterDAOImpl cdi = null;
		cdi = (CounterDAOImpl) new ClassPathXmlApplicationContext("config.xml").getBean("counterDAO");
		Counter counter = cdi.retrieve();
		category.setCategoryID(counter.getTotal());
		session.save(category);
		cdi.update();
	}

	public Category retrieve(long id) {
		Category category = null;
		category = session.load(Category.class, id);
		return category;
	}

	public void update(Category category) {
		session.save(category, category.getId().intValue());
	}

	public void delete(Category category) {
		session.delete(category);
	}

	public LinkedList<Category> retrieveAll() {
		LinkedList<Category> categories = null;
		categories = new LinkedList<Category>(session.loadAll(Category.class));
		return categories;
	}
}
