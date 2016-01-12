package com.aht.domain;

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
	private String description;
    private String picture;
	@Relationship(type = "IS", direction = Relationship.OUTGOING)
    private Set<Category> categories;

    public Long getId() {
        return id;
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

    public String getDescription() {
        return description;
    }

    public void setIngredients(String description) {
        this.description = description;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public String getPicture() {
        return this.picture;
    }
    
    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getCategoriesNames() {
    	String names = "";
    	Set<Category> categories = this.getCategories();
    	if(categories != null)
    		for(Category category : categories)
    			names += category.getName() + ",";
    	return names;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
                return true;
        if (obj == null)
                return false;
        if (getClass() != obj.getClass())
                return false;
        Dish other = (Dish) obj;
        if (name == null) {
                if (other.name != null)
                        return false;
        } else if (!name.equals(other.name))
                return false;
        return true;
    }

    public void addCategories(Category category) {
        if(categories == null) {
            categories = new HashSet<Category>();
            categories.add(category);
        }
        else if(!categories.contains(category))
            categories.add(category);
    }

    @Override
    public String toString() {
        return "id: " + id + " name: " + name + " description: " + description + " dishID: " + dishID;
    }
}
