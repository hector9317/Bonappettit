package com.example.domain;

import java.util.HashSet;
import java.util.Set;

import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.NodeEntity;
import org.neo4j.ogm.annotation.Relationship;

@NodeEntity
public class Category {
	@GraphId
	private Long id;
	private String name;
	private String type;
	private int categoryID;
	@Relationship(type = "IS", direction = Relationship.INCOMING)
	private Set<Dish> dishes;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
	public void hasDish(Dish dish) {
		if(dishes == null)
			dishes = new HashSet<Dish>();
		dishes.add(dish);
	}

	public Set<Dish> getDishes() {
		return dishes;
	}

	public void setDishes(Set<Dish> dishes) {
		this.dishes = dishes;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", type=" + type + ", categoryID=" + categoryID + "]";
	}

}
