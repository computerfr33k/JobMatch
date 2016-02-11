package com.jobmatch.repositories;

import com.jobmatch.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
	User findByUsername(String username);
	Iterable<User> findByRole(int role);
}
