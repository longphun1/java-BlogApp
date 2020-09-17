package com.example.demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.models.Blog;
import com.example.demo.models.Message;
import com.example.demo.repositories.BlogRepository;
import com.example.demo.repositories.MessageRepository;


@Service
public class BlogService {
	private final BlogRepository blogRepo;
	private final MessageRepository messageRepo;
	
	public BlogService(BlogRepository blogRepo, MessageRepository messageRepo) {
		this.blogRepo = blogRepo;
		this.messageRepo = messageRepo;
	}
	
	//Create Blog
	public Blog createBlog(Blog blog) {
		return this.blogRepo.save(blog);
	}
	
	//Get all blogs
	public List<Blog> getAllBlogs() {
		return this.blogRepo.findAll();
	}
	
	//Get One Blog
	public Blog findBlog(Long id) {
		Optional<Blog> optionalBlog = blogRepo.findById(id);
		if(optionalBlog.isPresent()) {
			return optionalBlog.get();
		}
		else {
			return null;
		}
	}
	
	//Update Blog
	public Blog updateBlog(Blog b) {
		return blogRepo.save(b);
	}
	
	//Delete Blog 
	public void deleteBlog(Long id) {
		blogRepo.deleteById(id);
	}
	
	//Create Message
	public Message createMessage(Message message) {
		return this.messageRepo.save(message);
	}
		
	//Get All messages
	public List<Message> getAllMessages(){
		return this.messageRepo.findAll();
	}
}
