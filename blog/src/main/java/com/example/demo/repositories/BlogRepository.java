package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.models.Blog;

@Repository
public interface BlogRepository extends CrudRepository<Blog, Long> {
	List<Blog> findAll();
}
