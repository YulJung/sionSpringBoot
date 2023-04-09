package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.UserEntity;


public interface LoginRepository extends JpaRepository<UserEntity, String> {

	UserEntity findByUserIdAndUserPw(String userId,String userPw);
}
