<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.example.dao.category.CategoryDAOImpl"%>
<%@page import="com.example.dao.dish.DishDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.domain.Category"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.domain.Dish"%>

<%
	DishDAOImpl ddi = (DishDAOImpl) new ClassPathXmlApplicationContext("config.xml").getBean("dishDAO");
	CategoryDAOImpl cdi = (CategoryDAOImpl) new ClassPathXmlApplicationContext("config.xml").getBean("categoryDAO");

	String[][] categories = new String[8][];
	String[] types = {"kind", "flavour", "occasion", "region", "health", "temperature", "people", "texture"};

	String name = request.getParameter("InputName");
	String ingredients = request.getParameter("InputMessage");
	
	categories[0] = request.getParameterValues("Tipo");
	categories[1] = request.getParameterValues("Sabor");
	categories[2] = request.getParameterValues("Ocasion");
	categories[3] = request.getParameterValues("Region");
	categories[4] = request.getParameterValues("Salud");
	categories[5] = request.getParameterValues("Temperature");
	categories[6] = request.getParameterValues("Persona");
	categories[7] = request.getParameterValues("Textura");
	
	Dish dish = new Dish();
	dish.setName(name);
	dish.setIngredients(ingredients);
	Category category = null;
	
	for(int i = 0; i < categories.length; i++) {
		if(categories[i] != null) {
			System.out.println("i: " + i);
			//for(int j = 0; j < categories[i][j].length(); j++) {
			for(String c : categories[i]) {
				System.out.println("category: " + c);
				category = new Category();
				category.setType(types[i]);
				category.setName(c);
				
				if(!cdi.exists(category)) {
			    	cdi.create(category);
				} else {
					category = cdi.findByName(c);
					System.out.println("----> " + category.toString());
				}
				dish.addCategories(category);
			}
		}
	}
   	ddi.create(dish);
	System.out.println(dish.toString());
%>
