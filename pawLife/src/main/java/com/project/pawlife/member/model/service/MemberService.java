package com.project.pawlife.member.model.service;

import com.project.pawlife.member.model.dto.Member;

public interface MemberService {

	/** 회원 로그인 
	 * @param inputMember
	 * @return loginMember
	 */
	Member login(Member inputMember);

}
