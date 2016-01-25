package com.jobmatch.repositories;

import com.jobmatch.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by eric on 1/21/16.
 */
@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
}