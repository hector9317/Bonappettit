package com.aht.dao.category;

import java.util.LinkedList;

import com.aht.domain.Category;

public interface CategoryDAO {
	public void create(Category category);
	public Category retrieve(long id);
	public void update(Category category);
	public void delete(Category category);
	public LinkedList<Category> retrieveAll();	
	
	/*
	public void create(Category category);
	public Category retrieve(long id);
	public void update(Category category);
	public void delete(Category category);
	public LinkedList<Category> retrieveAll();
	public Category findByName(String name);
	public boolean exists(Category category);
	*/
	
}
