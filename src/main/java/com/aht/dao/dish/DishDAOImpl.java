package com.aht.dao.dish;

import java.util.Set;
import java.util.LinkedList;
import org.neo4j.ogm.session.SessionFactory;
import org.neo4j.ogm.session.Session;
import com.aht.domain.Category;
import com.aht.domain.Dish;

public class DishDAOImpl implements DishDAO {
	private Session session;

	public DishDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}

	public void create(Dish dish) {
		session.save(dish);
	}

	public Dish retrieve(long id) {
		return session.load(Dish.class, id);
	}

	public void update(Dish dish) {
		session.save(Dish.class, dish.getId().intValue());
	}

	public void delete(Dish dish) {
		session.delete(dish);
	}

	public LinkedList<Dish> retrieveAll() {
		LinkedList<Dish> dishes = null;
		dishes = new LinkedList<Dish>(session.loadAll(Dish.class));
		return dishes;
	}

	public String categoriesNames(long id) {
		String names = "";
		DishDAOImpl ddi = new DishDAOImpl();
		Dish dish = ddi.retrieve(id);
		Set<Category> categories = dish.getCategories();
		if (categories != null) {
			for (Category category : categories)
				names += category.getName() + ",";
		}
		return names;
	}

	/*
	 * public void create(Dish dish) { CounterDAOImpl cdi = null; cdi =
	 * (CounterDAOImpl) new
	 * ClassPathXmlApplicationContext("config.xml").getBean("counterDAO");
	 * if(!exists(dish)) { Counter counter = cdi.retrieve();
	 * dish.setDishID(counter.getTotal()); session.save(dish); cdi.update(); } }
	 * 
	 * public Dish retrieve(long id) { Dish dish = null; dish =
	 * session.load(Dish.class, id); return dish; }
	 * 
	 * public void update(Dish dish) { session.save(dish,
	 * dish.getId().intValue()); }
	 * 
	 * public void delete(Dish dish) { if(exists(dish)) session.delete(dish); }
	 * 
	 * public LinkedList<Dish> retrieveAll() { LinkedList<Dish> categories =
	 * null; categories = new LinkedList<Dish>(session.loadAll(Dish.class));
	 * return categories; }
	 * 
	 * public LinkedList<Dish> retrieveSome(int page, int quantity){
	 * LinkedList<Dish> dishes = null; dishes = new
	 * LinkedList<Dish>(session.loadAll(Dish.class, new
	 * Pagination(page,quantity))); return dishes; }
	 * 
	 * public Dish findByName(String name) { Dish dish =
	 * session.queryForObject(Dish.class,
	 * "match (dish:Dish {name: {name}}) return dish",
	 * MapUtil.map("name",name)); return dish; }
	 * 
	 * public Dish findByDishID(int dishID) { Dish dish =
	 * session.queryForObject(Dish.class,
	 * "match (dish:Dish {dishID: {dishID}}) return dish", MapUtil.map("dishID",
	 * dishID)); return dish; }
	 * 
	 * public boolean exists(Dish dish) { boolean exists = false;
	 * LinkedList<Dish> records = retrieveAll(); if(records != null &&
	 * records.size() > 0) { if(records.contains(dish)) exists = true; } return
	 * exists; }
	 * 
	 * public LinkedList<Long> findDishesByUserID(int userID) { LinkedList<Long>
	 * identificadores = new LinkedList<Long>(); Iterable<Dish> it =
	 * session.query(Dish.class,
	 * "match (dish:Dish {userID: {userID}}) return dish", MapUtil.map("userID",
	 * userID)); for(Dish dish : it) identificadores.push(dish.getId()); return
	 * identificadores; }
	 * 
	 * public String categoriesNames(long id) { String names = ""; DishDAOImpl
	 * ddi = new DishDAOImpl(); Dish dish = ddi.retrieve(id); Set<Category>
	 * categories = dish.getCategories(); if(categories != null) { for(Category
	 * category : categories) names += category.getName() + ","; }
	 * 
	 * return names; }
	 * 
	 */

	/*
	 * public LinkedList<Integer> methodX() { Result rs = session.query(
	 * "match (dish:Dish {userID: {userID}}) - [r:IS] - (category:Category) return dish, category"
	 * , MapUtil.map("userID", 922)); Iterator<Map<String, Object>> iterator =
	 * rs.iterator(); LinkedList<Integer> identificadores = new
	 * LinkedList<Integer>(); while(iterator.hasNext()) { LinkedHashMap<String,
	 * Object> dishesResults = (LinkedHashMap<String, Object>)
	 * iterator.next().get("dish"); LinkedHashMap<String, Object>
	 * categoriesResults = (LinkedHashMap<String, Object>)
	 * iterator.next().get("category");
	 * //identificadores.add((int)dishesResults.get("dishID"));
	 * System.out.println(dishesResults.get("id"));
	 * //System.out.println(dishesResults.toString());
	 * //System.out.println(categoriesResults.toString());
	 * //System.out.println(); } return identificadores; }
	 */
}
