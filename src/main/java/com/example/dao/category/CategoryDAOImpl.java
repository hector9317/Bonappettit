package com.example.dao.category;

import java.util.LinkedList;
import com.example.model.Counter;
import com.example.domain.Category;
import com.example.dao.counter.CounterDAOImpl;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.neo4j.helpers.collection.MapUtil;
import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

public class CategoryDAOImpl implements CategoryDAO {
	private Session session;
	
	public CategoryDAOImpl() {
		this.session = new SessionFactory("com.example.domain").openSession("http://localhost:7474", "neo4j", "burros93");
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
}
