package com.aht.dao.category;

import java.util.LinkedList;

import org.neo4j.helpers.collection.MapUtil;
import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.aht.dao.counter.CounterDAOImpl;
import com.aht.dao.utils.ApplicationContextWrapper;
import com.aht.domain.Category;
import com.aht.model.Counter;

public class CategoryDAOImpl implements CategoryDAO {
	private Session session;
	
	public CategoryDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
		//this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "n0m3l0s3");
	}
	
	public void create(Category category) {
		CounterDAOImpl cdi = null;
		ApplicationContext applicationContext = ApplicationContextWrapper.getInstance();
		cdi = (CounterDAOImpl) applicationContext.getBean("counterDAO");
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
	
	public Category findByName(String name) {
		Category category = (Category) session.queryForObject(Category.class, "match (category:Category {name: {name}}) return category", MapUtil.map("name",name));
		return category;
	}
	
	public boolean exists(Category category) {
		boolean exists = false;
		LinkedList<Category> records = retrieveAll();
		if(records != null && records.size() > 0) {
			if(records.contains(category))
				exists = true;
		}
		return exists;
	}
	
	public void getTipoComida() {
		session.query("match (Category)", null);
	}
}
