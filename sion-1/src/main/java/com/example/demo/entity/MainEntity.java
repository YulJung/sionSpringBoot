package com.example.demo.entity;

import java.sql.Date;

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
@Table(name = "tif_main")
public class MainEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long mainId;
	private String tifNo;
	private String tifName;
	private String tifPlace;
	private Date tifStartDate;
	private Date tifEndDate;
	private String tifArea;
	private String tifWidth;
	private String tifLength;
}
