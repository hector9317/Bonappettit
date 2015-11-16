package com.example.dao.category;

import java.util.LinkedList;

import com.example.domain.Category;

public interface CategoryDAO {
	public void create(Category category);
	public Category retrieve(long id);
	public void update(Category category);
	public void delete(Category category);
	public LinkedList<Category> retrieveAll();
	public Category findByName(String name);
	public boolean exists(Category category);	
}
