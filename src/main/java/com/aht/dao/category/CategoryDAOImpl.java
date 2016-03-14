package com.aht.dao.category;

import com.aht.domain.Category;

import java.util.LinkedList;

import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

public class CategoryDAOImpl implements CategoryDAO {
	private Session session;
	
	public CategoryDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}
	
	public void create(Category category) {
		session.save(category);	}

	public Category retrieve(long id) {
		return session.load(Category.class, id);
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

	@SuppressWarnings("unchecked")
	public LinkedList<String>[] getKindOfFood() {
		LinkedList<Category> categories = retrieveAll();
		LinkedList<String>[] kindOfFood = new LinkedList[8];
		
		for(int i = 0; i < kindOfFood.length; i++)
			kindOfFood[i] = new LinkedList<String>();
				
		for(Category category : categories) {
			String type = category.getType();
			String name = category.getName();
			if(type.contains("Tipo de comida"))
				kindOfFood[0].add(name);
			else if(type.contains("Sabor"))
				kindOfFood[1].add(name);
			else if(type.contains("Ocasion"))
				kindOfFood[2].add(name);
			else if(type.contains("Region"))
				kindOfFood[3].add(name);
			else if(type.contains("Salud"))
				kindOfFood[4].add(name);
			else if(type.contains("Temperatura"))
				kindOfFood[5].add(name);
			else if(type.contains("Gente"))
				kindOfFood[6].add(name);
			else if(type.contains("Textura"))
				kindOfFood[7].add(name);
		}
		return kindOfFood;
	}

}


/*
public class CategoryDAOImpl implements CategoryDAO {
	private Session session;
	
	public CategoryDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
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
	
	public void byName(String name) {
		Iterable<Category> it = session.query(Category.class, "match (category:Category {name: {name}}) return category", MapUtil.map("name", name));
		for(Category category : it) {
			System.out.println("----------> " + category.toString());
		}
	}
	
	
	
	public Category findByName(String name) {
		Category category = (Category) session.queryForObject(Category.class, "match (category:Category {name: {name}}) return category", MapUtil.map("name", name));
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
	
	@SuppressWarnings("unchecked")
	public LinkedList<String>[] getKindOfFood() {
		LinkedList<Category> categories = retrieveAll();
		LinkedList<String>[] kindOfFood = new LinkedList[8];
		
		for(int i = 0; i < kindOfFood.length; i++)
			kindOfFood[i] = new LinkedList<String>();
				
		for(Category category : categories) {
			String type = category.getType();
			String name = category.getName();
			if(type.contains("Tipo de comida"))
				kindOfFood[0].add(name);
			else if(type.contains("Sabor"))
				kindOfFood[1].add(name);
			else if(type.contains("Ocasion"))
				kindOfFood[2].add(name);
			else if(type.contains("Region"))
				kindOfFood[3].add(name);
			else if(type.contains("Salud"))
				kindOfFood[4].add(name);
			else if(type.contains("Temperatura"))
				kindOfFood[5].add(name);
			else if(type.contains("Gente"))
				kindOfFood[6].add(name);
			else if(type.contains("Textura"))
				kindOfFood[7].add(name);
		}
		return kindOfFood;
	}
}
 */
/*
public LinkedList<Long> findDishesByUserID(int userID) {
	LinkedList<Long> identificadores = new LinkedList<Long>();
	Iterable<Dish> it = session.query(Dish.class, "match (dish:Dish {userID: {userID}}) return dish", MapUtil.map("userID", userID));
	for(Dish dish : it)
		identificadores.push(dish.getId());
	return identificadores;
}
 * 
 * */
