package com.example.demo.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class TifUserDTO {
	@NotBlank(message = "IDを入力してください。")
	private String userId;
	@NotBlank(message = "PWを入力してください。")
	private String userPw;
	
}
