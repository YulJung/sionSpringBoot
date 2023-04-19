package com.example.demo.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dto.DetailSaveDTO;
import com.example.demo.dto.DetailUpdateDTO;
import com.example.demo.dto.FindList;
import com.example.demo.dto.TifDetailDTO;
import com.example.demo.dto.TifListDTO;
import com.example.demo.entity.MainEntity;
import com.example.demo.repository.FacilityRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class FacilityServiceImpl implements FacilityService {
	private FacilityRepository fr;
	@Override
	public List<FindList> findList() {
		List<FindList> list = fr.findList();
		
		
		return list;
	}

	@Override
	public Long save(TifDetailDTO detailDTO) throws IOException {
		
		MainEntity main = MainEntity.toMainEntity(detailDTO);
		return fr.save(main).getMainId();
	}

	@Override
	public TifDetailDTO findByTifNo(String tifNo) {
		
		MainEntity main = fr.findByTifNo(tifNo);
		System.out.println(tifNo);
		TifDetailDTO dto = TifDetailDTO.toTifDetailDTO(main);
		
		return dto;
	}

	@Override
	public Long update(TifDetailDTO updateDTO) {
		MainEntity update = MainEntity.toUpdateEntity(updateDTO);
		return fr.save(update).getMainId();
	}

	@Override
	public void delete(String tifNo) {
		Long id = fr.findByTifNo(tifNo).getMainId();
		fr.deleteById(id);
	}

	@Override
	public List<FindList> findByTifPlace(String place) {
		// TODO Auto-generated method stub
		List<FindList> list = fr.findByTifPlace(place);
		
		return list;
	}

	@Override
	public List<FindList> findByTifNoList(String tifNo) {
		
		List<FindList> list = fr.findByTifNoList(tifNo);
		
		return list;
	}

}
