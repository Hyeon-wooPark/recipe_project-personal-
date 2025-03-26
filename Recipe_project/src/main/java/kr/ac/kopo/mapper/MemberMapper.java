package kr.ac.kopo.mapper;

import kr.ac.kopo.model.User;

public interface MemberMapper {

	public void join(User user);
	
	public User login(User user);
	
	public User doubleCheck(String id);
	
	public void userUpdate(User user);
		
	public User nickCheck(String nick);
	
	public void profileUpdate(User user);
	
	public User getUser(String id);
	
	public void deleteUser(String id);
}
