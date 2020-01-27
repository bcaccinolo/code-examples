package com.example.springsecurityuserdetailsservice;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        System.out.println("🔥 in the user details service");

        if (s.equals("marc")) {
            return User.withUsername("marc")
                    .password("root")
                    .roles("USER")
                    .build();
        } else {
            return null;
        }
    }
}
