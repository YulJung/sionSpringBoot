package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.example.demo.dto.FindList;
import com.example.demo.dto.TifDetailDTO;
import com.example.demo.dto.TifListDTO;
import com.example.demo.entity.MainEntity;


public interface FacilityRepository extends JpaRepository<MainEntity, Long>{

	
	// @Query("select u from User u where u.emailAddress = ?1")
	 // User findByEmailAddress(String emailAddress);
	
	//list 
	@Query(value="SELECT m.tif_no,"
			+ "m.tif_name ,"
			+ "b.basyo_name ,"
			+ "m.tif_start_date ,"
			+ "m.tif_end_date ,"
			+ "a.amt_fee ,"
			+ "count(h.harai_deposit) tifcount"
			+ " from TIF_MAIN m join TIF_BASYO b on m.TIF_PLACE = b.basyo_code"
			+ " join("
			+ "	select tif_no,amt_date,amt_Fee,ROW_NUMBER()OVER(PARTITION BY TIF_NO ORDER BY TIF_NO,AMT_DATE DESC)AS final_Date"
			+ "	FROM TIF_AMT) A ON M.TIF_NO = A.TIF_NO AND A.final_Date = 1"
			+ "	LEFT JOIN TIF_HARAI H ON M.TIF_NO = H.TIF_NO AND H.HARAI_DATE BETWEEN M.TIF_START_DATE AND M.TIF_END_DATE"
			+ "	GROUP BY M.TIF_NO,M.TIF_NAME,B.BASYO_NAME,M.TIF_START_DATE,M.TIF_END_DATE,A.AMT_FEE",nativeQuery=true)
	List<FindList> findList();

	MainEntity findByTifNo(String tifNo);
	
	@Query(value="SELECT m.tif_no,"
			+ "m.tif_name ,"
			+ "b.basyo_name ,"
			+ "m.tif_start_date ,"
			+ "m.tif_end_date ,"
			+ "a.amt_fee ,"
			+ "count(h.harai_deposit) tifcount"
			+ " from TIF_MAIN m join TIF_BASYO b on m.TIF_PLACE = b.basyo_code"
			+ " join("
			+ "	select tif_no,amt_date,amt_Fee,ROW_NUMBER()OVER(PARTITION BY TIF_NO ORDER BY TIF_NO,AMT_DATE DESC)AS final_Date"
			+ "	FROM TIF_AMT) A ON M.TIF_NO = A.TIF_NO AND A.final_Date = 1"
			+ "	LEFT JOIN TIF_HARAI H ON M.TIF_NO = H.TIF_NO AND H.HARAI_DATE BETWEEN M.TIF_START_DATE AND M.TIF_END_DATE"
			+ " where m.tif_place = ?1"
			+ "	GROUP BY M.TIF_NO,M.TIF_NAME,B.BASYO_NAME,M.TIF_START_DATE,M.TIF_END_DATE,A.AMT_FEE",nativeQuery=true)
	List<FindList> findByTifPlace(String place);
	@Query(value="SELECT m.tif_no,"
			+ "m.tif_name ,"
			+ "b.basyo_name ,"
			+ "m.tif_start_date ,"
			+ "m.tif_end_date ,"
			+ "a.amt_fee ,"
			+ "count(h.harai_deposit) tifcount"
			+ " from TIF_MAIN m join TIF_BASYO b on m.TIF_PLACE = b.basyo_code"
			+ " join("
			+ "	select tif_no,amt_date,amt_Fee,ROW_NUMBER()OVER(PARTITION BY TIF_NO ORDER BY TIF_NO,AMT_DATE DESC)AS final_Date"
			+ "	FROM TIF_AMT) A ON M.TIF_NO = A.TIF_NO AND A.final_Date = 1"
			+ "	LEFT JOIN TIF_HARAI H ON M.TIF_NO = H.TIF_NO AND H.HARAI_DATE BETWEEN M.TIF_START_DATE AND M.TIF_END_DATE"
			+ " where m.tif_no = ?1"
			+ "	GROUP BY M.TIF_NO,M.TIF_NAME,B.BASYO_NAME,M.TIF_START_DATE,M.TIF_END_DATE,A.AMT_FEE",nativeQuery=true)
	List<FindList> findByTifNoList(String tifNo);
	
	
	//save
	
	//update
	
	//delete
	
	
}
