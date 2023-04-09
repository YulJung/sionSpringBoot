package com.example.demo.service;

import java.io.IOException;

import org.springframework.stereotype.Service;

import com.example.demo.dto.TifUserDTO;
import com.example.demo.entity.UserEntity;
import com.example.demo.repository.LoginRepository;

import lombok.AllArgsConstructor;



@Service
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {
	private LoginRepository lr;
	@Override
	public Long save(TifUserDTO userDTO) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean login(TifUserDTO userDTO) {
		System.out.println(userDTO.getUserId()+","+userDTO.getUserPw());
		 UserEntity user = UserEntity.toUserLoginEntity(userDTO);
	        
		 UserEntity byUserIdAndUserPw = lr.findByUserIdAndUserPw(user.getUserId(), user.getUserPw());
	        
	        if(byUserIdAndUserPw==null){

	            return false;
	        }
	        else return true;
	}

}
