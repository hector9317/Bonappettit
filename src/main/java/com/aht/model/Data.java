package com.aht.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.aht.dao.dish.DishDAOImpl;
import com.aht.domain.Dish;

public class Data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		if(id != 0) {
			DishDAOImpl ddi = new DishDAOImpl();
			Dish dish = ddi.retrieve(id);
			JSONObject json = new JSONObject();
			json.put("id", id);
			
			json.put("name", dish.getName());
			json.put("ingredients", dish.getIngredients());
			json.put("categories", dish.getCategoriesNames());
			response.setContentType("application/json");
			response.getWriter().write(json.toString());
		}
	}
}
