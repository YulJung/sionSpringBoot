package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@GetMapping("/")
	public String menuView() {
		
		return "menu";
	}
	@GetMapping("/list")
	public String menuList() {
		
		return "facilityList";
		
	}
	@GetMapping("/new")
	public String faciltyNew() {
		
		return "facilityDetail";
	}
	@GetMapping("/update")
	public String faciltyUpdate() {
		
		return "facilityDetail";
	}
	@GetMapping("/delete")
	public String faciltyDelete() {
		
		return "facilityDetail";
	}


}
