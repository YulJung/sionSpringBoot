package com.example.demo.dto;

import java.sql.Date;

import com.example.demo.entity.MainEntity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class TifDetailDTO {

		private String tifNo;
		private String tifName;
		private String tifPlace;
		private Date tifStartDate;
		private Date tifEndDate;
		private String tifArea;
		private String tifWidth;
		private String tifLength;
		private Long mainId;
		public static TifDetailDTO toTifDetailDTO(MainEntity main) {
			TifDetailDTO dto = new TifDetailDTO();
		
			if(main.getTifArea()==null) {
				dto.setTifArea(" ");
			}else {
				dto.setTifArea(main.getTifArea());
			}
			if(main.getTifLength()==null) {
				dto.setTifLength(" ");
			}else {
				dto.setTifLength(main.getTifLength());
			}
			if(main.getTifWidth()==null) {
				dto.setTifWidth(" ");
			}else {
				dto.setTifWidth(main.getTifWidth());
			}
			
			dto.setTifEndDate(main.getTifEndDate());
			dto.setMainId(main.getMainId());
			dto.setTifName(main.getTifName());
			dto.setTifNo(main.getTifNo());
			dto.setTifPlace(main.getTifPlace());
			dto.setTifStartDate(main.getTifStartDate());
			
			return dto;
		}
}
