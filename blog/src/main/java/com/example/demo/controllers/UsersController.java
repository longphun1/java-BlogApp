package com.example.demo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.models.User;
import com.example.demo.services.UserService;
import com.example.demo.validator.UserValidator;

@Controller
public class UsersController {
	private final UserService userService;
	private final UserValidator userValidator;
	
	public UsersController(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
	@RequestMapping("/")
	public String registerForm(@ModelAttribute("user") User user) {
		return "index.jsp";
	}
	
	@PostMapping("/")
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		User u = userService.registerUser(user);
		session.setAttribute("userId", u.getId());
		return "redirect:/blogs";
	}
	
	@PostMapping("/login")
	public String loginUser(@ModelAttribute("user") User user, @RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, Model model) {
		boolean isAuthenticated = userService.authenticateUser(email, password);
		if(isAuthenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/blogs";
		}
		else {
			model.addAttribute("errors", "Invalid Crendentials. Please Try Again.");
			return "index.jsp";
		}
	}
	
//	@RequestMapping("/event")
//	public String home(HttpSession session, Model model) {
//		Long userId = (Long) session.getAttribute("userId");
//		User u = userService.findUserById(userId);
//		System.out.println(userId);
//		model.addAttribute("user", u);
//		return "event.jsp";
//	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
