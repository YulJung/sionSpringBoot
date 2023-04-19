package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String menuList(Model model,@RequestParam(value="place",required = false)String place,
			@RequestParam(value="tifNo",required = false)String tifNo) {
			System.out.println("tifNo:"+tifNo);
			if(place!=null) {
				List<FindList> facilityList = fs.findByTifPlace(place);
				model.addAttribute("facilityList",facilityList);
			}else if(tifNo!=null) {
				System.out.println("tifnolist");
				List<FindList> facilityList = fs.findByTifNoList(tifNo);
				model.addAttribute("facilityList",facilityList);
			}else {
				List<FindList> facilityList = fs.findList();
				model.addAttribute("facilityList",facilityList);
				
			}
			
		
		return "facilityList";
	}
	@GetMapping("/new")
	public String faciltyNew(Model model) {
		model.addAttribute("urlForm", "menu/new");
		return "facilityDetail";
	}
	@GetMapping("/update")
	public String faciltyUpdate(Model model) {
		model.addAttribute("urlForm", "menu/update");
		return "facilityDetail";
	}
	@GetMapping("/delete")
	public String faciltyDelete(Model model) {
		model.addAttribute("urlForm", "menu/delete");
		return "facilityDetail";
	}


}
