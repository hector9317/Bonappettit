package com.aht.dao.user;

import java.util.LinkedList;

import org.neo4j.helpers.collection.MapUtil;
import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

import com.aht.domain.User;

public class UserDAOImpl implements UserDAO {
	private Session session;
	
	public UserDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}

	@Override
	public LinkedList<User> retrieveAll() {
		LinkedList<User> users = null;
		users = new LinkedList<User>(session.loadAll(User.class));
		return users;
	}

	@Override
	public void create(User user) {
		session.save(user);
	}

	@Override
	public User retrieve(long id) {
		User user = null;
		user = session.load(User.class, id);
		return user;
	}

	@Override
	public void update(User user) {
		session.save(user, user.getId().intValue());
	}

	@Override
	public void delete(User user) {
		session.delete(user);
	}

	@Override
	public User exists(String username, String email) {
		User user = null;
		user = session.queryForObject(User.class, "match( user: User {username: {username}, email: {email}}) return dish", MapUtil.map("username", username, "email", email));
		return user;
	}

	@Override
	public void findByUsername(String username) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void findByEmail(String email) {
		// TODO Auto-generated method stub
		
	}

}
