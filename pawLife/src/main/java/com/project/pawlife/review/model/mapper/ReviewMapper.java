package com.project.pawlife.review.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.pawlife.review.model.dto.Review;

@Mapper
public interface ReviewMapper {

	/** 게시글 작성
	 * @param inputReivew
	 * @return
	 */
	int reviewInsert(Review inputReivew);

	/** 삭제되지 않은 게시글 조회
	 * @return
	 */
	int getListCount();

	/** 게시글 리스트 조회
	 * @param rowBounds
	 * @return
	 */
	List<Review> selectReviewList(RowBounds rowBounds);

	/** 게시글 상세 조회
	 * @param map
	 * @return
	 */
	Review selectOneReview(Map<String, Integer> map);

	/** 게시글 수정
	 * @param inputReview
	 * @return
	 */
	int reviewUpdate(Review inputReview);

	/** 게시글 삭제
	 * @param map
	 * @return
	 */
	int reviewDelete(Map<String, Integer> map);

	
}
