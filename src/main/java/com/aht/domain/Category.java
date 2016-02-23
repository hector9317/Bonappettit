package com.aht.domain;

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
	
	public Category() { }
	
	public Category(String type, String name) {
		this.type = type;
		this.name = name;
	}

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

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public Set<Dish> getDishes() {
        return dishes;
    }

    public void setDishes(Set<Dish> dishes) {
        this.dishes = dishes;
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
        Category other = (Category) obj;
        if (name == null) {
                if (other.name != null)
                        return false;
        } else if (!name.equals(other.name))
                return false;
        return true;
    }

    public void addDishes(Dish dish) {
        if(dishes == null)
            dishes = new HashSet<Dish>();
        else if(!dishes.contains(dish))
            dishes.add(dish);
    }

    @Override
    public String toString() {
        return "id: " + id + " name: " + name + " type: " + type + " categoryID: " + categoryID;
    }
}
