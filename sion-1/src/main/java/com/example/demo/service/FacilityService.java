package com.example.demo.service;


import java.io.IOException;
import java.util.List;


import com.example.demo.dto.*;



public interface FacilityService {

	List<FindList> findList();
	
	Long save(TifDetailDTO detailDTO) throws IOException;
	
	TifDetailDTO findByTifNo(String tifNo);
	
	Long update(TifDetailDTO updateDTO);
	
	void delete(String tifNo);

	List<FindList> findByTifPlace(String place);

	List<FindList> findByTifNoList(String tifNo);
	
	
}
