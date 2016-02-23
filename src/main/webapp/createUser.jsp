<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.aht.dao.user.UserDAOImpl"%>
<%@page import="com.aht.domain.User"%>
<%
	int id = 0;
	String name;
	String lastName;
	String lastNameII;
	String username;
	String password;
	String gender;
	String nationality;
	String birthDate;
	String email;
	User user = null;
	UserDAOImpl udi = new UserDAOImpl();
	request.setCharacterEncoding("utf-8");
	
	if(request.getParameter("id") != null)
		id = Integer.parseInt(request.getParameter("id"));


	name = request.getParameter("name");
	lastName = request.getParameter("lastName");
	lastNameII = request.getParameter("lastNameII");
	username = request.getParameter("username");
	password = request.getParameter("password");
	gender = request.getParameter("gender");
	nationality = request.getParameter("nationality");
	birthDate = request.getParameter("birthDate");
	email = request.getParameter("email");
	
	if(id != 0)
		user = udi.retrieve(id);
	else
		user = new User();
	
	Date fecha = new Date();
	user.setName(name);
	user.setLastName(lastName);
	user.setLastNameII(lastNameII);
	user.setUsername(username);
	user.setPassword(password);
	user.setGender(gender);
	user.setNationality(nationality);
	user.setBirthDate(birthDate);
	user.setEmail(email);
	user.setDate(new SimpleDateFormat("YYYY-MM-dd").format(fecha));

	if(id != 0)
		udi.update(user);
	else
		udi.create(user);
	
	response.sendRedirect("http://localhost:8080/Bonappettit/");

%>
