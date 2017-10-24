/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Ragon
 */
public class Usuario {
    public int idUsuario;
    public String username;
    public String clave;
    public String rol;
    public String estado;
    
    public Usuario(int idUsuario, String username, String clave, String rol, String estado){
        this.idUsuario = idUsuario;
        this.username = username;
        this.clave = clave;
        this.rol = rol;
        this.estado = estado;
    }
    
    public Usuario(){}
    
}
