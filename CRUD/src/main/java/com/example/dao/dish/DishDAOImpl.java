package com.example.dao.dish;

import java.util.LinkedList;
import com.example.domain.Dish;
import com.example.model.Counter;

import org.neo4j.ogm.session.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.example.connection.Connection;
import com.example.dao.counter.CounterDAOImpl;

public class DishDAOImpl implements DishDAO {
	private Session session;
	
	public DishDAOImpl() {
    	Connection connection = Connection.getConnection();
    	this.session = connection.getSession();

	}

	public void create(Dish dish) {
		CounterDAOImpl cdi = null;
		cdi = (CounterDAOImpl) new ClassPathXmlApplicationContext("config.xml").getBean("counterDAO");
		Counter counter = cdi.retrieve();
		dish.setDishID(counter.getTotal());
		session.save(dish);
		cdi.update();
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
}
