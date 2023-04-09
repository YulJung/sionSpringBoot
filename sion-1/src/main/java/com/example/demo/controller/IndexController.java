package com.example.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.TifUserDTO;
import com.example.demo.repository.LoginRepository;
import com.example.demo.service.LoginService;

import jakarta.servlet.http.HttpSession;
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

//        String user = (String) httpSession.getAttribute("user");
//
//        if(user != null) {
//            model.addAttribute("userName", user);
//           
//        }

        return "index";
    }
    
    @PostMapping("/login")
    public String Login(@ModelAttribute TifUserDTO userDTO,HttpSession session) {
    	
    	boolean result = ls.login(userDTO);
    	if(result)return "redirect:/menu/";
    	else return "redirect:/";
    	
    }
    
 
}