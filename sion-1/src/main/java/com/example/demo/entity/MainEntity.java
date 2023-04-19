package com.example.demo.entity;

import java.sql.Date;

import com.example.demo.dto.TifDetailDTO;

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
	public static MainEntity toMainEntity(TifDetailDTO detailDTO) {
		MainEntity main = new MainEntity();
		
		main.setTifArea(detailDTO.getTifArea());
		main.setTifEndDate(detailDTO.getTifEndDate());
		main.setTifLength(detailDTO.getTifLength());
		main.setTifName(detailDTO.getTifName());
		main.setTifNo(detailDTO.getTifNo());
		main.setTifPlace(detailDTO.getTifPlace());
		main.setTifStartDate(detailDTO.getTifStartDate());
		main.setTifWidth(detailDTO.getTifWidth());
		
		
		return main;
	}
	public static MainEntity toUpdateEntity(TifDetailDTO updateDTO) {
		// TODO Auto-generated method stub
		MainEntity main = new MainEntity();
		main.setTifNo(updateDTO.getTifNo());
		main.setTifArea(updateDTO.getTifArea());
		main.setTifEndDate(updateDTO.getTifEndDate());
		main.setTifLength(updateDTO.getTifLength());
		main.setTifName(updateDTO.getTifName());
		main.setMainId(updateDTO.getMainId());
		main.setTifPlace(updateDTO.getTifPlace());
		main.setTifStartDate(updateDTO.getTifStartDate());
		main.setTifWidth(updateDTO.getTifWidth());
		return main;
	}
}
