package com.example.demo.entity;

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
@Table(name = "tif_basyo")
public class BasyoEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long basyoId;
	private String basyoCode;
	private String basyoName;
}
