<%@page import="com.aht.domain.Dish"%>
<%@page import="com.aht.dao.dish.DishDAOImpl"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>

<%
	int id = Integer.valueOf(request.getParameter("id"));
	DishDAOImpl ddi = (DishDAOImpl) new ClassPathXmlApplicationContext("config.xml").getBean("dishDAO");
	Dish dish = ddi.retrieve(id);
	ddi.delete(dish);
	response.sendRedirect("index.jsp");
%>