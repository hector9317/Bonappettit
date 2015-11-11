package com.example.dao.dish;

import java.util.LinkedList;

import com.example.domain.Dish;

public interface DishDAO {
	public void create(Dish dish);
	public Dish retrieve(long dishID);
	public void update(Dish dish);
	public void delete(Dish dish);
	public LinkedList<Dish> retrieveAll();
}
