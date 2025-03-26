package kr.ac.kopo.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.model.User;

public interface UserService {
	
	public void add(User user, String emailId, String domain, int resident1, int resident2, int phone1);
	
	public User login(User user);
	
	public int doubleCheck(String id);
	
	public void userUpdate(User user, String emailId, String domain);
	
	public int nickCheck(String nick);
	
	public void profileUpdate(User user,MultipartFile file, HttpServletRequest request, HttpSession session) throws IOException;
	
	public User getUser(String userId);
	
	public void deleteUser(String userId, HttpServletRequest request);
}
