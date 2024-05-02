package com.project.pawlife.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.pawlife.adoption.model.dto.Adopt;
import com.project.pawlife.main.model.service.MainService;
import com.project.pawlife.review.model.dto.Review;
import com.project.pawlife.review.model.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController {

	@Autowired
	private final MainService service;
	private final ReviewService reviewService;

	
	@RequestMapping("")
	public String mainPage(){
		return "common/main";
	}
  
	 /** 입양 게시글
	 * @param model
	 * @return
	 */
	@GetMapping("")
	public String mainDisplay(Model model) {
	
		int cp = 1;

		List<Adopt> adoptList = service.selectMainAdopt();
		  
		  if(!adoptList.isEmpty()) {
			  model.addAttribute(adoptList);
		  }
		  
		  
		  
		  ////////
		  
		  
		Map<String, Object> reviewMap = reviewService.selectReviewList(cp);
		  
		if(!reviewMap.isEmpty()) model.addAttribute("reviewList", reviewMap.get("reviewList"));
		
		
		  return "common/main";
		  
	  }












	@GetMapping("loginError")
	public String loginError(RedirectAttributes ra) {
		
		ra.addFlashAttribute("message","로그인 후 이용 가능합니다.");
		return "redirect:/";
	}
  
  
  
	 
}
