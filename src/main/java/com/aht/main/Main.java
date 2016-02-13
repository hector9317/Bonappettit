package com.aht.main;

import com.aht.domain.Dish;
import com.aht.dao.dish.DishDAOImpl;

public class Main {
	public static void main(String[] args) {
    	DishDAOImpl ddi = new DishDAOImpl();
    	Dish dish = new Dish();
    	dish.setName("Jesús");
    	ddi.create(dish);
	}
}
