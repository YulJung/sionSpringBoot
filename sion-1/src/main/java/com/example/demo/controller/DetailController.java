package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.TifDetailDTO;
import com.example.demo.service.FacilityService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/detail")
public class DetailController {
	private final FacilityService fs;
	
	@GetMapping("/new")
	public String newDetail(Model model) {
		model.addAttribute("urlForm", "register");
		return "facilityDetail";
	}
	@GetMapping("/update")
	public String updateDetail(@RequestParam("tifNo")String tifNo,Model model) {
		TifDetailDTO detailDTO1 = fs.findByTifNo(tifNo);
		model.addAttribute("urlForm", "update");
		model.addAttribute("detail",detailDTO1);
		return "facilityDetail";
	}
	@GetMapping("/delete")
	public String deleteDetail(Model model,@RequestParam("tifNo")String tifNo) {
		TifDetailDTO detailDTO1 = fs.findByTifNo(tifNo);
		model.addAttribute("urlForm", "delete");
		model.addAttribute("detail",detailDTO1);
		return "facilityDetail";
	}
}
