package com.example.demo.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TifListDTO {

	private String tifNo;
	private String tifName;
	private String basyoName;
	private Date tifStartDate;
	private Date tifEndDate;
	private int amtFee;
	private int tifCount;
	
}
