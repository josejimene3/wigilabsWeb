/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wigilabs.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Desarrollo
 */
@Controller
public class HomeController {
    
    @GetMapping({"/", "/login"})
    public String index() {
        return "index";
    }
    
    @GetMapping("/principal")
    public String principal() {
        return "plantilla";
    }
}
