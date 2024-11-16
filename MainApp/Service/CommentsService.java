package com.MainApp.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Pojo.Comments;
import com.MainApp.Repository.CommentRepository;

@Service
public class CommentsService 
{
	@Autowired
	CommentRepository comRepo;
	
	public void AddComment(Comments uname)
	{
		
//		return comRepo.findByUname(uname);
		
	comRepo.save(uname);
		
	}

}
