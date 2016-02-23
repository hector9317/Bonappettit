package com.aht.dao.user;

import java.util.LinkedList;

import com.aht.domain.User;

public interface UserDAO {
	public LinkedList<User> retrieveAll();
	public void create(User user);
	public User retrieve(long id);
	public void update(User user);
	public void delete(User user);
	public User exists(String username, String email);
	public void findByUsername(String username);
	public void findByEmail(String email);
}
