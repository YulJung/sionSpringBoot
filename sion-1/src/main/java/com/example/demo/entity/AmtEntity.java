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
@Table(name = "tif_amt")
public class AmtEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long amtId;
	private Date amtDate;
	private int amtFee;
	private String tifNo;
}
