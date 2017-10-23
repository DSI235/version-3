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
    
    public Usuario(int idusuario, String username, String clave, String rol){
        this.idUsuario = idUsuario;
        this.username = username;
        this.clave = clave;
        this.rol = rol;
    }
    
    public Usuario(){}
    
}
