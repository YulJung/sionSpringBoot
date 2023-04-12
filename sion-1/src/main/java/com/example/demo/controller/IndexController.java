package com.example.demo.controller;


import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.TifUserDTO;
import com.example.demo.repository.LoginRepository;
import com.example.demo.service.LoginService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class IndexController {
	private final  LoginService ls;
    private HttpSession httpSession;
    private TifUserDTO userDTO;
    private LoginRepository loginRepo;
    @GetMapping("/")
    public String index(Model model){


        return "index";
    }

    @PostMapping("/login")
    public String Login(@Valid  TifUserDTO userDTO,Errors er,Model model) {
    	if(er.hasErrors()) {
    		System.out.println();
    		model.addAttribute("userId",userDTO.getUserId());
    		model.addAttribute("userPw",userDTO.getUserPw());
    		Map<String, String> validatorResult = ls.validateHandling(er);
    		for (String key : validatorResult.keySet()) {
    		System.out.println(key+", "+validatorResult.get(key));
    		model.addAttribute(key, validatorResult.get(key));
    		}
    		return "index";
    	}
    	boolean result = ls.login(userDTO);
    	if(result)return "redirect:/menu/";
    	else {
    		System.out.println("login fail");
    		model.addAttribute("loginFail","一致するユーザーデータがありません。");
    		
    		return "index";
    	}
    	
    }
    
 
}