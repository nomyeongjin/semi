package com.project.pawlife.adoption.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pawlife.adoption.model.service.AdoptionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@RequestMapping("adoption")
@Slf4j
public class AdoptionController {
	
	private final AdoptionService service;
	
	@GetMapping("adoptionList")
	public String adoption() {
		return "adoption/adoptionList";
	}

}
