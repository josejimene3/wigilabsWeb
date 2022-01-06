/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wigilabs.web.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Desarrollo
 */
public class Episodio {
    
    private Long id;
    
    @NotEmpty(message = "Debe ingresar un nombre.")
    @Size(min = 2, max = 50, message = "Debe ingresar entre 2-50 caracteres.")
    private String nombre;
    
    @NotNull(message = "Debe ingresar la duración del episodio.")
    @Min(message = "La duración deber ser mayor a: 0", value = 1)
    private int duracion;
    
    @NotNull(message = "Debe seleccionar una temporada.")
    private Temporada temporada;

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the duracion
     */
    public int getDuracion() {
        return duracion;
    }

    /**
     * @param duracion the duracion to set
     */
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    /**
     * @return the temporada
     */
    public Temporada getTemporada() {
        return temporada;
    }

    /**
     * @param temporada the temporada to set
     */
    public void setTemporada(Temporada temporada) {
        this.temporada = temporada;
    }
}
