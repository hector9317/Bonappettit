package com.example.domain;

import java.util.HashSet;
import java.util.Set;

import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.NodeEntity;
import org.neo4j.ogm.annotation.Relationship;

@NodeEntity
public class Dish {
	@GraphId
	private Long id;
	private int dishID;
	private String name;
	private String ingedients;
	@Relationship(type = "IS", direction = Relationship.OUTGOING)
	private Set<Category> categories;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getDishID() {
		return dishID;
	}

	public void setDishID(int dishID) {
		this.dishID = dishID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIngedients() {
		return ingedients;
	}

	public void setIngedients(String ingedients) {
		this.ingedients = ingedients;
	}
	
	public void hasCategory(Category category) {
        if (categories == null) {
            categories = new HashSet<Category>();
        }
        categories.add(category);
    }

	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}

	@Override
	public String toString() {
		return "Dish [id=" + id + ", dishID=" + dishID + ", name=" + name + ", ingedients=" + ingedients + "]";
	}
	
}
