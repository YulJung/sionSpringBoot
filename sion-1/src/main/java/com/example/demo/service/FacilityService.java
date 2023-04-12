package com.example.demo.service;


import java.io.IOException;
import java.util.List;


import com.example.demo.dto.*;



public interface FacilityService {

	List<FindList> findList();
	
	Long save(DetailSaveDTO saveDTO) throws IOException;
	
	TifDetailDTO findByTifNo(String tifNo);
	
	Long update(DetailUpdateDTO updateDTO);
	
	boolean delete(String tifNo);
	
	
}
