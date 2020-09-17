package com.example.demo.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.models.Blog;
import com.example.demo.models.Message;
import com.example.demo.models.User;
import com.example.demo.services.BlogService;
import com.example.demo.services.UserService;

@Controller
public class BlogController {
	private final UserService userService;
	private final BlogService service;
	
	private BlogController(UserService userService, BlogService service) {
		this.userService = userService;
		this.service = service;
	}
	
	//Get All Blogs
	@GetMapping("/blogs")
	public String allBlogs(HttpSession session, Model model) {
		List<Blog> blogs = service.getAllBlogs();
		model.addAttribute("blogs", blogs);
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		return "dashboard.jsp";
	}
	
	//New blog
	@GetMapping("/blog/new")
	public String newBlog(@ModelAttribute("blog") Blog blog) {
		return "newBlog.jsp";
	}
	
	//Create blog
	@PostMapping("/blogs")
	public String create(@Valid @ModelAttribute("blog") Blog blog, BindingResult result) {
		if(result.hasErrors()) {
			return "/newBlog.jsp";
		}
		else {
			service.createBlog(blog);
			return "redirect:/blogs";
		}
	}
	
	//Blog info
	//Get all messages
	@GetMapping("/blogs/{id}")
	public String blogInfo(@PathVariable("id") Long id, Model model, @ModelAttribute("message") Message messaage) {
		model.addAttribute("blog", this.service.findBlog(id));
		List<Message> messages = service.getAllMessages();
		model.addAttribute("messages", messages);
		return "info.jsp";
	}
	
	//Create message
	@PostMapping("/messages")
	public String createMessage(@Valid @ModelAttribute("message") Message message, BindingResult result) {
		if(result.hasErrors()) {
			return "redirect:/blogs/" + message.getBlog().getId();
		}
		else {
			service.createMessage(message);
			return "redirect:/blogs/" + message.getBlog().getId();
		}
	}
	
	//Edit page
	@GetMapping("/blogs/{id}/edit")
	public String editPage(@PathVariable("id") Long id, Model model, @ModelAttribute("blog") Blog blog, @ModelAttribute("message") Message messaage) {
		model.addAttribute("blog", this.service.findBlog(id));
		List<Message> messages = service.getAllMessages();
		model.addAttribute("messages", messages);
		return "editBlog.jsp";
	}
	
	//Edit blog
	@PostMapping("/blogs/{id}/edit")
	public String editBlog(@Valid @ModelAttribute("blog") Blog blog, BindingResult result, @PathVariable("id") Long id) {
		if(result.hasErrors()) {
			return "/editBlog.jsp";
		}
		else {
			service.updateBlog(blog);
			return "redirect:/blogs/" + blog.getId();
		}
	}
	
	//Delete Blog
	@PostMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		service.deleteBlog(id);
		return "redirect:/blogs";
	}
}
