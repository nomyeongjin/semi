package com.project.pawlife.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.pawlife.member.model.dto.Member;
import com.project.pawlife.member.model.service.MemberService;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@SessionAttributes({"loginMember"}) // request로 올라간 loginMember session에 올리기
@Controller
@RequiredArgsConstructor
@RequestMapping("member")
//@RequestMapping("member") <- 이게 있으면 모든 요청이 앞에 member가 있어야 함 안그럼 에러 남
@Slf4j
public class MemberController {

	private final MemberService service;


	 
	 /** 로그인 페이지 이동
		 * @return
		 */
		@GetMapping("login")
		public String loginPage() {
			return"member/login";
		}
		
		
		/** 회원 가입 페이지 이동
		 * @return
		 */
		@GetMapping("signup")
		public String signupPage() {
			
			return "member/signup";
		}
		
		
		@PostMapping("login")
		public String login(Member inputMember, 
				                    RedirectAttributes ra,
				                    Model model
				                
				                    ) {
			
			// 체크박스에 value가 없을 때
			// - 체크가 된 경우 : "on" (null 아님)
			// - 체크가  안된 경우 : null
			//log.debug("saveId: "+saveId);
			
			
			// 로그인 서비스 호출
			Member loginMember = service.login(inputMember);
			
			
			// 로그인 실패 시 
			if(loginMember == null) {
				ra.addFlashAttribute("message","아이디 또는 비밀번호가 일치하지 않습니다");
				
				return "redirect:/member/login";
			}
		
			// 로그인 성공
			if(loginMember !=null) {
			ra.addFlashAttribute("message","로그인 성공");
				
				model.addAttribute("loginMember", loginMember);
			}
			
			
			return "redirect:/"; // 메인 페이지 재요청
		}
		
		
}
