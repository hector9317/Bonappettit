package com.aht.dao.dish;

import com.aht.domain.Dish;
import com.aht.model.Counter;
import com.aht.dao.counter.CounterDAOImpl;
import org.neo4j.ogm.cypher.query.Pagination;
import org.neo4j.ogm.session.SessionFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.LinkedList;

import org.neo4j.helpers.collection.MapUtil;
import org.neo4j.ogm.session.Session;

public class DishDAOImpl implements DishDAO {
	private Session session;
	
	public DishDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "n0m3l0s3");
	}
	//given:
	//  Dish dish
	//when:
	//  create(dish)
	//then:
	//  dish.id != null


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
		if(exists(dish))
			session.delete(dish);
	}

	public LinkedList<Dish> retrieveAll() {
		LinkedList<Dish> categories = null;
		categories = new LinkedList<Dish>(session.loadAll(Dish.class));
		return categories;
	}

    public LinkedList<Dish> retrieveSome(int page, int quantity){
        LinkedList<Dish> dishes = null;
        dishes = new LinkedList<Dish>(session.loadAll(Dish.class, new Pagination(page,quantity)));
        return dishes;
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
