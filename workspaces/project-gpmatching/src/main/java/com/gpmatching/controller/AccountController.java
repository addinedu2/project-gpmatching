package com.gpmatching.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.UserDto;
import com.gpmatching.service.AccountService;

@Controller
@RequestMapping(path = { "/account" })
public class AccountController {
	
	private AccountService accountService;
	
	@Autowired
	@Qualifier("accountService")
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	
	
	@GetMapping(path = { "/register" })
	public String registerForm() {
		
		return "account/register";
	}
	
	@PostMapping(path = { "/register" })
	public String register(@ModelAttribute("user") @Valid UserDto user, BindingResult result) {
		
		if(result.hasErrors()) {
			return "account/register";
		}
		accountService.register(user);
		
		return "redirect:/home";
	}
}
