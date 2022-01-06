/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wigilabs.web.service;

import com.google.gson.Gson;
import com.wigilabs.web.model.Serie;
import com.wigilabs.web.model.Usuario;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author Desarrollo
 */
@Service
public class AuthService {

    private static final String URI = "https://apim3w.com/api/index.php/v1/soap/LoginUsuario.json";
    
    private Gson gson = new Gson();
    
    @Autowired
    RestTemplate restTemplate;

    public Usuario authenticate(Map<String, Object> request) {
        
        Usuario u = null;
        
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("X-MC-SO", "WigilabsTest");
        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(request, headers);

        ResponseEntity<String> responseEntity = restTemplate
                .postForEntity(URI, entity, String.class);

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            JSONObject json = new JSONObject(responseEntity.getBody().toString());
            int error = json.getInt("error");
            if (error == 0) {
                u = gson.fromJson(json.getJSONObject("response")
                        .getJSONObject("usuario").toString(), Usuario.class);
            }
        }
        
        return u;
    }

    public Map<String, Object> createRequest(String username, String password) {
        Map<String, String> request = new HashMap<>();
        request.put("nombreUsuario", username);
        request.put("clave", password);
        
        Map<String, Object> data = new HashMap<>();
        data.put("data", request);
        return data;
    }
}
