package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.FindList;
import com.example.demo.dto.TifListDTO;
import com.example.demo.service.FacilityService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/menu")
public class MenuController {
	private FacilityService fs;
	@GetMapping("/")
	public String menuView() {
		
		return "menu";
	}
	@GetMapping("/list")
	public String menuList(Model model) {
	
			List<FindList> facilityList = fs.findList();
		
			model.addAttribute("facilityList",facilityList);
		
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
