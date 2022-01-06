/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wigilabs.web.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Desarrollo
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Serie {
    
    private Long id;
    
    @NotEmpty(message = "Debe ingresar un nombre.")
    @Size(min = 2, max = 50, message = "Debe ingresar entre 2-50 caracteres.")
    private String nombre;
    
    @NotEmpty(message = "Debe ingresar el género.")
    @Size(min = 2, max = 50, message = "Debe ingresar entre 2-50 caracteres.")
    private String genero;
    
    @NotNull(message = "Debe ingresar una calificación.")
    @Max(message = "Debe ingresar una califición entre: 1 y 5", value = 5)
    @Min(message = "La calificación mínima es: 1", value = 1)
    private int calificacion;

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
     * @return the genero
     */
    public String getGenero() {
        return genero;
    }

    /**
     * @param genero the genero to set
     */
    public void setGenero(String genero) {
        this.genero = genero;
    }

    /**
     * @return the calificacion
     */
    public int getCalificacion() {
        return calificacion;
    }

    /**
     * @param calificacion the calificacion to set
     */
    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }
}
