/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wigilabs.web.model;

/**
 *
 * @author Desarrollo
 */
public class Usuario {
     
    private String nombre;
    private String apellido;
    private String UserProfileID;
    private String DocumentNumber;

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
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the UserProfileID
     */
    public String getUserProfileID() {
        return UserProfileID;
    }

    /**
     * @param UserProfileID the UserProfileID to set
     */
    public void setUserProfileID(String UserProfileID) {
        this.UserProfileID = UserProfileID;
    }

    /**
     * @return the DocumentNumber
     */
    public String getDocumentNumber() {
        return DocumentNumber;
    }

    /**
     * @param DocumentNumber the DocumentNumber to set
     */
    public void setDocumentNumber(String DocumentNumber) {
        this.DocumentNumber = DocumentNumber;
    }
    
}
