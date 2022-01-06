/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wigilabs.web.controller;

import com.google.gson.Gson;
import com.wigilabs.web.model.Pelicula;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import javax.validation.Valid;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author Desarrollo
 */
@Controller
@RequestMapping("/peliculas")
public class PeliculaController {

    private final String URI_BASE = "http://localhost:8080/wigilabs/api/v1/";
    private final String URI_PELICULAS = URI_BASE + "peliculas";
    private final String URI_PELICULAS_ID = URI_BASE + "peliculas/{id}";

    private Gson gson = new Gson();

    @Autowired
    RestTemplate restTemplate;

    @GetMapping
    public String listar(@RequestParam(name = "page", required = false,
            defaultValue = "0") Integer page,
            @RequestParam(name = "size", required = false,
                    defaultValue = "20") Integer size,
            Model model,
            RedirectAttributes attributes) {
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        HttpEntity<String> entity = new HttpEntity<>(headers);

        Map<String, Integer> params = new HashMap<>();
        params.put("page", page);
        params.put("size", size);

        UriComponentsBuilder builder = UriComponentsBuilder
                .fromUriString(URI_PELICULAS)
                .queryParam("page", page)
                .queryParam("size", size);

        ResponseEntity<String> responseEntity = restTemplate
                .exchange(builder.buildAndExpand(params).toUri(), HttpMethod.GET, entity, String.class);

        JSONObject json = new JSONObject(responseEntity.getBody().toString());
        Pelicula[] peliculas = null;
        JSONObject response = json.getJSONObject("response");
        peliculas = gson.fromJson(response
                .getJSONArray("peliculas").toString(), Pelicula[].class);

        model.addAttribute("currentPage", response.getInt("currentPage"));
        model.addAttribute("totalPages", response.getInt("totalPages"));
        model.addAttribute("totalItems", response.getInt("totalItems"));
        model.addAttribute("size", response.getInt("size"));
        model.addAttribute("peliculas", peliculas);
        model.addAttribute("titulo", "PELÍCULAS");
        return "vistas/peliculas/listar";
    }

    @GetMapping("/{id}")
    public String listarId(@PathVariable(value = "id") String id,
            Model model,
            RedirectAttributes attributes) {
        Map<String, String> params = new HashMap<>();
        params.put("id", id);
        ResponseEntity<String> responseEntity = restTemplate
                .getForEntity(URI_PELICULAS_ID.replace("{id}", id), String.class, params);

        JSONObject json = new JSONObject(responseEntity.getBody().toString());
        String error = json.getString("error");
        Pelicula pelicula = null;
        if (error.equals("1")) {
            attributes.addFlashAttribute("error", json.getString("response"));
            return "redirect:/peliculas";
        }
        pelicula = gson.fromJson(json.getJSONObject("response").toString(), Pelicula.class);

        model.addAttribute("pelicula", pelicula);
        model.addAttribute("titulo", "EDITAR PELÍCULA");

        return "vistas/peliculas/editar";
    }

    @GetMapping("/nuevo")
    public String peliculaView(Model model) {
        model.addAttribute("pelicula", new Pelicula());
        model.addAttribute("titulo", "NUEVA PELÍCULA");
        return "vistas/peliculas/guardar";
    }

    @PostMapping("/nuevo")
    public String nuevo(@Valid @ModelAttribute(value = "pelicula") Pelicula pelicula,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes attributes) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("titulo", "NUEVA PELÍCULA");
            return "vistas/peliculas/guardar";
        }
        
        Pelicula nuevo = restTemplate
                .postForObject(URI_PELICULAS, pelicula, Pelicula.class);
        attributes.addFlashAttribute("success", "Película registrada con éxito");
        return "redirect:/peliculas";
    }

    @PutMapping("/nuevo")
    public String editar(@Valid @ModelAttribute(value = "pelicula") Pelicula pelicula,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes attributes) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("titulo", "EDITAR PELÍCULA");
            return "vistas/peliculas/editar";
        }
        restTemplate
                .put(URI_PELICULAS, pelicula, Pelicula.class);
        attributes.addFlashAttribute("success", "Película actualizada con éxito");
        return "redirect:/peliculas";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminarId(@PathVariable(value = "id") String id,
            RedirectAttributes attributes) {
        Map<String, String> params = new HashMap<>();
        params.put("id", id);
        restTemplate.delete(URI_PELICULAS_ID.replace("{id}", id), params);
        attributes.addFlashAttribute("warning", "Película eliminada");
        return "redirect:/peliculas";
    }
}
