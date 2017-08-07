package me.jmll.ti.service;

import java.util.List;

import me.jmll.ti.model.User;


public interface UserService {
	public List<User> getUsers();
	public User getUser(String username);
	public User createUser(String username, String password, String fullName); 
	public boolean login(String username, String password);
	public void deleteUser(String username);
	public User updateUser(User user);
}
