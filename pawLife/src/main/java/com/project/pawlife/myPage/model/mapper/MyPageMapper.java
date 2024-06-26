package com.project.pawlife.myPage.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.pawlife.adoption.model.dto.Adopt;
import com.project.pawlife.member.model.dto.Member;
import com.project.pawlife.review.model.dto.Review;

@Mapper
public interface MyPageMapper {
	
	/** 로그인한 회원이 작성한 입양 게시글 조회
	 * @param memberNo
	 * @param rowBounds 
	 * @return adoptList
	 */
	List<Adopt> selectAdopt(int memberNo, RowBounds rowBounds);

	/** 로그인한 회원이 작성한 후기 게시글 조회
	 * @return
	 */
	List<Review> selectReview(int memberNo, RowBounds rowBounds);

	/** 로그인한 회원이 작성한 댓글 조회
	 * @param memberNo
	 * @param rowBounds 
	 * @return
	 */
	List<Review> selectComment(int memberNo, RowBounds rowBounds);
	
	/** 로그인한 회원이 북마크한 게시물 조회
	 * @param memberNo
	 * @param rowBounds 
	 * @return bookmarkList
	 */
	List<Adopt> selectBookMark(int memberNo, RowBounds rowBounds);
	
	/** 프로필 이미지 변경
	 * @param mem
	 * @return result
	 */
	int profile(Member mem);

	/** 개인 정보 수정(닉네임/ 전화번호)
	 * @param inputMember
	 * @return result
	 */
	int profileUpdate(Member inputMember);

	/** 비밀번호 대조
	 * @param memberNo
	 * @return
	 */
	String selectPw(int memberNo);

	/** 비밀번호 수정
	 * @param map
	 * @return
	 */
	int changeMemberPw(Map<String, Object> map);

	/** 회원 탈퇴
	 * @param memberNo
	 * @return
	 */
	int deleteMember(int memberNo);

	/** 로그인한 회원이 작성한 입양 게시글의 수정 페이지로 이동
	 * @param map
	 * @return
	 */
	Adopt selectOneAdopt(Map<String, Integer> map);

	/** 로그인한 회원이 작성한 입양 게시글
	 * ( 마이페이지 입양 리스트)에서 입양 완료 버튼을 누른 경우
	 * @param memberNo
	 * @return
	 */
	int adoptDel(int memberNo);

	/** 로그인한 회원이 작성한 입양 게시글 완료 여부 변경
	 * @param adopt
	 * @param memberNo 
	 * @return
	 */
	int changeAdoptComplete(Adopt adopt);

	/** 회원 입양 게시글 수 
	 * @param memberNo 
	 * @return
	 */
	int memberListCount(int memberNo);

	/** 회원 후기 게시글 수
	 * @param memberNo
	 * @return
	 */
	int reviewListCount(int memberNo);

	/** 회원이 작성한 댓글 수
	 * @param memberNo
	 * @return
	 */
	int commentListCount(int memberNo);

	/** 회원이 북마크한 게시글 수
	 * @param memberNo
	 * @return
	 */
	int bookmarkListCount(int memberNo);



}
