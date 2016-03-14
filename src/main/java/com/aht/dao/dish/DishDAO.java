package com.aht.dao.dish;

import java.util.LinkedList;

import com.aht.domain.Dish;

public interface DishDAO {
	public void create(Dish dish);
	public Dish retrieve(long id);
	public void update(Dish dish);
	public void delete(Dish dish);
	public LinkedList<Dish> retrieveAll();
	public String categoriesNames(long id);	
	/*
	public void create(Dish dish);
	public Dish retrieve(long dishID);
	public void update(Dish dish);
	public void delete(Dish dish);
	public LinkedList<Dish> retrieveAll();
	public Dish findByName(String name);
	public boolean exists(Dish dish);
	*/
}
