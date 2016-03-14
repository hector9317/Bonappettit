package com.aht.dao.user;

import com.aht.domain.User;

public interface UserDAO {
	public void create(User user);
	public User retrieve(long id);
	public void update(User user);
	public void delete(User user);
	public User findByUsername(String username);
	public User findByEmail(String email);
}
