<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.aht.dao.category.CategoryDAOImpl"%>
<%@page import="com.aht.dao.dish.DishDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.aht.domain.Category"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.aht.domain.Dish"%>

<%
	int id = Integer.parseInt(request.getParameter("idValue"));
	String name = request.getParameter("InputName");
	String ingredients = request.getParameter("InputMessage");
	
	System.out.print("----------------->>>");
	DishDAOImpl ddi = new DishDAOImpl();
	CategoryDAOImpl cdi = new CategoryDAOImpl();
	
	String[][] categories = new String[8][];
	String[] types = {"kind", "flavour", "occasion", "region", "health", "temperature", "people", "texture"};
	
	categories[0] = request.getParameterValues("Tipo");
	categories[1] = request.getParameterValues("Sabor");
	categories[2] = request.getParameterValues("Ocasion");
	categories[3] = request.getParameterValues("Region");
	categories[4] = request.getParameterValues("Salud");
	categories[5] = request.getParameterValues("Temperature");
	categories[6] = request.getParameterValues("Persona");
	categories[7] = request.getParameterValues("Textura");
	
	Dish dish = new Dish();	
	if(id != 0)
		dish = ddi.retrieve(id);
	else
		dish = new Dish();
	
	dish.setName(name);
	dish.setIngredients(ingredients);
	Category category = null;
	
	for(int i = 0; i < categories.length; i++) {
		if(categories[i] != null) {
			for(String c : categories[i]) {
				category = new Category();
				category.setType(types[i]);
				category.setName(c);
				
				if(!cdi.exists(category)) {
			    	cdi.create(category);
				} else {
					category = cdi.findByName(c);
				}
				dish.addCategories(category);
			}
		}
		if(id != 0)
			ddi.update(dish);
		else
			ddi.create(dish);
	}
	response.sendRedirect("modify_or_delete.jsp");
%>
