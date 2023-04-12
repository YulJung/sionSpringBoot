package com.example.demo.service;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dto.DetailSaveDTO;
import com.example.demo.dto.DetailUpdateDTO;
import com.example.demo.dto.FindList;
import com.example.demo.dto.TifDetailDTO;
import com.example.demo.dto.TifListDTO;
import com.example.demo.repository.FacilityRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class FacilityServiceImpl implements FacilityService {
	private FacilityRepository fr;
	@Override
	public List<FindList> findList() {
		List<FindList> list = fr.findList();
		System.out.println("list : "+list.get(0).getTifCount());
		System.out.println("list : "+list.get(0).getBasyo_Name());
		System.out.println("list : "+list.get(0).getTif_Name());
		System.out.println("list : "+list.get(0).getAmt_Fee());
		
		return list;
	}

	@Override
	public Long save(DetailSaveDTO saveDTO) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TifDetailDTO findByTifNo(String tifNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long update(DetailUpdateDTO updateDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(String tifNo) {
		// TODO Auto-generated method stub
		return false;
	}

}
