package com.jobmatch.services;

import com.jobmatch.models.User;
import com.jobmatch.repositories.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class JobMatchUserDetailsService implements UserDetailsService {
    protected static final Logger log = LoggerFactory.getLogger(JobMatchUserDetailsService.class);

    private final UserRepository userRepository;

    @Autowired
    public JobMatchUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException(String.format("User %s does not exist!", username));
        }

        return new UserRepositoryUserDetails(user);
    }
}