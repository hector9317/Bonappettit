package com.aht.dao.user;

import org.neo4j.helpers.collection.MapUtil;
import org.neo4j.ogm.session.Session;
import org.neo4j.ogm.session.SessionFactory;

import com.aht.domain.User;

public class UserDAOImpl implements UserDAO {
	private Session session;

	public UserDAOImpl() {
		this.session = new SessionFactory("com.aht.domain").openSession("http://localhost:7474", "neo4j", "burros93");
	}

	public void create(User user) {
		session.save(user);
	}

	public User retrieve(long id) {
		return session.load(User.class, id);
	}

	public void update(User user) {
		session.save(user, user.getId().intValue());
	}

	public void delete(User user) {
		session.delete(user);
	}

	public User findByUsername(String username) {
		return (User) session.queryForObject(User.class, "match (user:User {username: {username}}) return user", MapUtil.map("username", username));
	}
	
	public User findByEmail(String email) {
		return (User) session.queryForObject(User.class, "match (user:User {email: {email}}) return user", MapUtil.map("email", email));
	}
}

/*
	
	/*
	@Override
	public void create(User user) {
		session.save(user);
	}

	@Override
	public User retrieve(long id) {
		User user = new User();
		user = session.load(User.class, id);
		return user;
	}

	@Override
	public void update(User user) {
		session.save(User.class, user.getId().intValue());
	}

	@Override
	public void delete(User user) {
		session.delete(user);
	}

	@Override
	public boolean exists(String username, String email) {
		return false;
	}
*/
