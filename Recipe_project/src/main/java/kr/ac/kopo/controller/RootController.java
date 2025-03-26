package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {
	
	@GetMapping("/")
	String index() {
		return "main/index";
	}
	
	@GetMapping("/brand")
	String brand() {
		return "main/brand";
	}
	
	
}
