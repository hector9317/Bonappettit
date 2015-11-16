package com.example.dao.dish;

import java.util.LinkedList;
import com.example.domain.Dish;
import com.example.model.Counter;
import com.example.dao.counter.CounterDAOImpl;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.neo4j.helpers.collection.MapUtil;
import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

public class DishDAOImpl implements DishDAO {
	private Session session;
			
	public DishDAOImpl() {
		this.session = new SessionFactory("com.example.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}
		
	public void create(Dish dish) {
		CounterDAOImpl cdi = null;
		cdi = (CounterDAOImpl) new ClassPathXmlApplicationContext("config.xml").getBean("counterDAO");
		if(!exists(dish)) {
			Counter counter = cdi.retrieve();
			dish.setDishID(counter.getTotal());
			session.save(dish);
			cdi.update();			
		}
	}

	public Dish retrieve(long id) {
		Dish dish = null;
		dish = session.load(Dish.class, id);
		return dish;
	}

	public void update(Dish dish) {
		session.save(dish, dish.getId().intValue());
	}

	public void delete(Dish dish) {
		session.delete(dish);
	}

	public LinkedList<Dish> retrieveAll() {
		LinkedList<Dish> categories = null;
		categories = new LinkedList<Dish>(session.loadAll(Dish.class));
		return categories;
	}
	
	public Dish findByName(String name) {
		Dish dish = session.queryForObject(Dish.class, "match (dish:Dish {name: {name}}) return dish", MapUtil.map("name",name));
		return dish;
	}
	
	public boolean exists(Dish dish) {
		boolean exists = false;
		LinkedList<Dish> records = retrieveAll();
		if(records != null && records.size() > 0) {
			if(records.contains(dish))
				exists = true;
		}
		return exists;
	}
}
