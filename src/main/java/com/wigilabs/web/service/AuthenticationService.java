/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wigilabs.web.service;

import com.wigilabs.web.model.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Desarrollo
 */
@Service
public class AuthenticationService implements AuthenticationProvider {

    private AuthService authService;

    @Autowired
    public void setAuthService(AuthService authService) {
        this.authService = authService;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String usuario = authentication.getName();
        String clave = authentication.getCredentials().toString();

        Usuario u = authService.authenticate(authService.createRequest(usuario, clave));
        if (u != null) {
            List<GrantedAuthority> roles = new ArrayList<>();
            roles.add(new SimpleGrantedAuthority("ADMIN"));

            authentication = new UsernamePasswordAuthenticationToken(usuario, clave, roles);
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return authentication;
        }
        throw new AuthenticationServiceException("Invalid credentials.");
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
