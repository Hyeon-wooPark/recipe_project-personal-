package kr.ac.kopo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.model.User;
import kr.ac.kopo.service.UserService;

@Controller
@RequestMapping("user/")
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/join")
	String join() {
		return "user/join";
	}
	
	@PostMapping("/join")
	String join(User user, String passwd, String emailId, String domain, int resident1, int resident2, int phone1) {
		user.setProfile("");
		user.setPasswd(passwd);
		userService.add(user, emailId, domain, resident1, resident2, phone1);
		
		return "redirect:/";
	}
	
	@GetMapping("/login")
	String login() {
		return "user/login";
	}
	
	@PostMapping("/login")
	String login(User user, HttpSession session, RedirectAttributes rttr) {
		if (user.getUserId() == null || user.getUserId().equals("") || user.getPasswd() == null || user.getPasswd().equals("")) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "모든 내용을 입력해주세요.");
			return "redirect:login";
		}
		
		User mvo = userService.login(user);
		if(mvo == null) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
			rttr.addFlashAttribute("msg", "다시 로그인 해주세요.");
			return "redirect:login";
		} else {
			rttr.addFlashAttribute("msgType", "성공 메세지");
			rttr.addFlashAttribute("msg", "로그인에 성공했습니다.");
			session.setAttribute("mvo", mvo);
			return "redirect:/";
		}
	}
	
	
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/doubleCheck")
	public @ResponseBody int doubleCheck(String id) {
		return userService.doubleCheck(id);
	}

	@GetMapping("/nickCheck")
	public @ResponseBody int nickCheck(String nick) {
		return userService.nickCheck(nick);
	}
	
	@GetMapping("/update")
	public String update() {
		return "user/update";
	}
	
	@PostMapping("/update")
	public String update(User user, String emailId, String domain) {
		userService.userUpdate(user, emailId, domain);
		return "redirect:/";
	}
	
	@GetMapping("/profile")
	public String profile() {
		return "user/profile";
	}
	
	@PostMapping("/profile")
	public String profile(@RequestParam MultipartFile file, User user, HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws IOException {
		int fileMaxSize = 40 * 1024 * 1024;
		if(file.getSize() > fileMaxSize) {
			rttr.addFlashAttribute("msgType", "실패 메세지");
            rttr.addFlashAttribute("msg", "파일의 크기는 40MB를 넘을 수 없습니다.");
            return "redirect:profile";
		}
		
	    // 프로필 업데이트 서비스 호출
	    userService.profileUpdate(user, file, request, session);
	    
	    rttr.addFlashAttribute("msgType", "성공 메세지");
	    rttr.addFlashAttribute("msg", "프로필 사진이 변경되었습니다.");
	    return "redirect:/";

	}
	
	@GetMapping("/inform")
	public String inform(String userId, Model model) {
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		return "user/inform";
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser(String userId, HttpServletRequest request, HttpSession session) {
		userService.deleteUser(userId, request);
		session.invalidate();
		return "redirect:/";
	}
}
