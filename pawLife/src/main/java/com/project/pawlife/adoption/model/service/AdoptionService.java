package com.project.pawlife.adoption.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.project.pawlife.adoption.model.dto.Adopt;

public interface AdoptionService {

	// 게시글 작성
	int adoptionInsert(Adopt inputAdopt, MultipartFile thumnailImg, int memberNo);

	/** 게시글 리스트
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectAdoptList(int cp);

	/** 게시글 상세 조회
	 * @param map
	 * @return
	 */
	Adopt selectOneAdopt(Map<String, Integer> map);

}
