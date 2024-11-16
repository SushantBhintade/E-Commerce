package com.MainApp.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Pojo.Comments;
import java.util.List;


@Repository
public interface CommentRepository extends CrudRepository<Comments, Integer>
{
     List<Comments> findByUname(String uname);

	List<Comments> save(String uname);
}
