package com.example.demo.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.validation.Errors;

import com.example.demo.dto.TifUserDTO;


public interface LoginService {
	
	Long save(TifUserDTO userDTO) throws IOException;

	boolean login(TifUserDTO userDTO);

	Map<String, String> validateHandling(Errors er);
}
