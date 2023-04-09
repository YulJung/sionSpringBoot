package com.example.demo.entity;

import  com.example.demo.dto.TifUserDTO;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
@Entity
@Getter
@Setter
@Table(name = "tif_user")
public class UserEntity {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
	   	private Long idNumber;
	    private String userId;
	    private String userPw;
	   
	    public static UserEntity toUserLoginEntity(TifUserDTO userDTO) {
	        UserEntity user = new UserEntity();
	        user.setUserId(userDTO.getUserId());
	        user.setUserPw(userDTO.getUserPw());
	        return user;
	    }
	    
}
