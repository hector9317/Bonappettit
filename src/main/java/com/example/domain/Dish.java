package com.example.domain;

import java.util.Set;
import java.util.HashSet;
import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.NodeEntity;
import org.neo4j.ogm.annotation.Relationship;

@NodeEntity
public class Dish {
	@GraphId
	private Long id;
	private int dishID;
	private String name;
	private String ingredients;
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

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
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
        if(categories == null)
            categories = new HashSet<Category>();
        else if(!categories.contains(category))
            categories.add(category);
    }

    @Override
    public String toString() {
        return "id: " + id + " name: " + name + "ingredients: " + ingredients + " dishID: " + dishID;
    }
}
