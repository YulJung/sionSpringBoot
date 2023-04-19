package com.example.demo.controller;

import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.DetailUpdateDTO;
import com.example.demo.dto.TifDetailDTO;
import com.example.demo.service.FacilityService;

import jakarta.servlet.http.HttpServletRequest;
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
		System.out.println("con"+tifNo);
		TifDetailDTO detailDTO1 = fs.findByTifNo(tifNo);
		model.addAttribute("urlForm", "delete");
		model.addAttribute("detail",detailDTO1);
		return "facilityDetail";
	}
	@PostMapping("/todo")
	public String todo(@ModelAttribute TifDetailDTO detailDTO,HttpServletRequest request) throws IOException {
		Long result = fs.save(detailDTO);
		if(result==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/detail/new");
			return "alert";
		}else {
			request.setAttribute("msg", "seikou.");
			request.setAttribute("url", "/menu/list");
			return "alert";
		}
		
	}
	@PostMapping("/find")
	public @ResponseBody TifDetailDTO findData(@ModelAttribute TifDetailDTO detailDTO) {
		TifDetailDTO detailDTO1 = fs.findByTifNo(detailDTO.getTifNo());
		
		
		return detailDTO1;
	}
	 @PutMapping("{tifNo}")
	    public ResponseEntity update (@PathVariable String tifNo,@ModelAttribute TifDetailDTO updateDTO)  throws IOException {
	     updateDTO.setMainId(fs.findByTifNo(tifNo).getMainId());   
		 fs.update(updateDTO);
	        return new ResponseEntity(HttpStatus.OK);
    }
	 @DeleteMapping("{tifNo}")
	 public ResponseEntity delete (@PathVariable String tifNo) {
	    fs.delete(tifNo);
	      return new ResponseEntity(HttpStatus.OK);
	 }
	
}
