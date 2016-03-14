package com.aht.domain;

import java.util.Set;
import java.util.HashSet;
import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.NodeEntity;
import org.neo4j.ogm.annotation.Relationship;

@NodeEntity
public class Category {
	@GraphId
	private Long id;
	private String name;
	private String type;
	@Relationship(type = "IS", direction = Relationship.INCOMING)
	private Set<Dish> dishes;

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public Set<Dish> getDishes() {
		return dishes;
	}

	public void setDishes(Set<Dish> dishes) {
		this.dishes = dishes;
	}
	
	public void addDish(Dish dish) {
		if(dishes == null)
			dishes = new HashSet<Dish>();
		else if(!dishes.contains(dish))
			dishes.add(dish);
	}
	
	@Override
	public String toString() {
		return "id: " + id + " name: " + name + " type: " + type;
	}
}

/*
 * @NodeEntity public class Category {
 * 
 * @GraphId private Long id; private String name; private String type; private
 * int categoryID;
 * 
 * @Relationship(type = "IS", direction = Relationship.INCOMING) private
 * Set<Dish> dishes;
 * 
 * public Long getId() { return id; }
 * 
 * public void setId(Long id) { this.id = id; }
 * 
 * public String getName() { return name; }
 * 
 * public void setName(String name) { this.name = name; }
 * 
 * public String getType() { return type; }
 * 
 * public void setType(String type) { this.type = type; }
 * 
 * public int getCategoryID() { return categoryID; }
 * 
 * public void setCategoryID(int categoryID) { this.categoryID = categoryID; }
 * 
 * public Set<Dish> getDishes() { return dishes; }
 * 
 * public void setDishes(Set<Dish> dishes) { this.dishes = dishes; }
 * 
 * public void addDish(Dish dish) { if(dishes == null) dishes = new
 * HashSet<Dish>(); else if(!dishes.contains(dish)) dishes.add(dish); }
 * 
 * @Override public String toString() { String category = "id: " + id +
 * " type: " + type + " name: " + name + " categoryID: " + categoryID; if(dishes
 * != null) category += " dishes: " + dishes.size(); return category; } }
 */
