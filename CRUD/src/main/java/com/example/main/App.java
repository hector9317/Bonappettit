package com.example.main;

import java.util.Set;
import org.neo4j.ogm.session.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.example.connection.Connection;
import com.example.dao.dish.DishDAOImpl;
import com.example.dao.category.CategoryDAOImpl;
import com.example.dao.counter.CounterDAOImpl;
import com.example.domain.Category;
import com.example.domain.Dish;
import com.example.model.Counter;

public class App {
    public static void main(String[] args) {
    	CategoryDAOImpl cdi = new CategoryDAOImpl();
    	DishDAOImpl ddi = new DishDAOImpl();

    	Category category = new Category();
    	category.setName("Comida mexicana");
    	category.setType("Kind");
    	cdi.create(category);

    	Dish dish = new Dish();
    	dish.setName("Tacos");
    	dish.setIngedients("Carne Tortilla Cilantro");
    	dish.hasCategory(category);
       	ddi.create(dish);



    	/*
    	ejemplo de como crear un platillo
    	Dish dish = new Dish();
    	dish.setDishID(1);
    	dish.setName("Tacos");
    	dish.setIngedients("Carne Tortill Cilantro");
       	ddi.create(dish);
    	*/

    	/*
    	ejemplo de como crear una categoria y un platillo
    	Category category = new Category();
    	category.setCategoryID(1);
    	category.setName("Principal");
    	category.setType("Kind");
    	cdi.create(category);

    	Dish dish = new Dish();
    	dish.setName("Pozole");
    	dish.setIngedients("Maiz Tostadas Carne");
    	ddi.create(dish);
    	*/
	
    	/*
    	Recuperar para actualizar info, en este caso crea una relacion
    	Category category = cdi.retrieve(0);
    	dish.hasCategory(category);
    	ddi.update(dish);
    	*/
    
    	/*
		Eliminar un registro
    	Category category = cdi.retrieve(0);
    	cdi.delete(category);		
    	*/
    	
    	/*
    	obtiene los platillos pertenecientes a una categoria
    	Category category = cdi.retrieve(0);
    	Set<Dish> dishes = category.getDishes();
    	for(Dish dish : dishes)
    		System.out.println("<-------" + dish.toString());    	
    	*/
    	
    	/*
    	obtiene las categorias a las que pertenece un platillo
    	Dish dish = ddi.retrieve(1);
    	Set<Category> categories = dish.getCategories();
    	for(Category category : categories)
    		System.out.println(category.toString());
    	
    	*/
    	
    	
    }
}
