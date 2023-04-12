package com.example.demo.dto;

import java.sql.Date;

public interface FindList {
	String getTif_No();
	String getTif_Name();
	String getBasyo_Name();
	Date getTif_Start_Date();
	Date getTif_End_Date();
	int getAmt_Fee();
	int getTifCount();
}
