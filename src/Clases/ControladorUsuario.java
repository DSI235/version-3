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

//IMPORT DE CLASES NECESARIAS
import connections.ListasTablas;
import connections.conection;
import connections.iList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class ControladorUsuario {
    static conection cn = new conection();
    
    public static void Agregar(Usuario U) throws ErrorTienda {
        try {
            cn.Conectar();
            iList u = new iList(new ListasTablas("IdUsuario", U.idUsuario));
            u.add(new ListasTablas("Username", U.username));
            u.add(new ListasTablas("Clave", U.clave));
            u.add(new ListasTablas("Rol", U.rol));
            cn.AgregarRegistro("Usuario", u, false);
        } catch (Exception e) {
            throw new ErrorTienda("Class ControladorUsuario/Agregar", e.getMessage());
        }
    }
    
    public static void Modificar(Usuario U) throws ErrorTienda {
        try {
            cn.Conectar();
            iList a = new iList(new ListasTablas("IdUsuario", U.idUsuario));
            iList u = new iList(new ListasTablas("Username", U.username));
            u.add(new ListasTablas("Clave", U.clave));
            u.add(new ListasTablas("Rol", U.rol));
            cn.ModificarRegistro("Usuario", u, a);
        } catch (Exception e) {
            throw new ErrorTienda("Class ControladorUsuario/Modificar", e.getMessage());
        }

    }
    
    public static void Eliminar(Usuario U) throws ErrorTienda {

        try {
            cn.Conectar();
            iList cond = new iList(new ListasTablas("IdUsuario", U.idUsuario));
            if (cn.Eliminar("Usuario", cond)) {
                System.out.println("Registro eliminado exitosamente");
            }

        } catch (Exception e) {
            throw new ErrorTienda("Class ControladorUsuario/Eliminar", e.getMessage());
        }
    }
    
    
    public static ArrayList<Usuario> Obtener() throws ErrorTienda {
        String[] cm = new String[]{"IdUsuario", "Username", "Clave", "Rol"};

        ArrayList<Object> listaUsuarios = new ArrayList();
        try {
            cn.Conectar();
            PreparedStatement ps = cn.BuscarTodos("Usuario", cm);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                listaUsuarios.add(rs.getString("IdUsuario"));
                listaUsuarios.add(rs.getString("Username"));
                listaUsuarios.add(rs.getString("Clave"));
                listaUsuarios.add(rs.getString("Rol"));
            }
            
            cn.Desconectar();
            
        } catch (Exception e) {
            throw new ErrorTienda("Class ControladorUsuario/Obtener", e.getMessage());
        }
        ArrayList<Usuario> listaUsuario = (ArrayList) listaUsuarios;
        return listaUsuario;
    }
    
    public Integer ObtenerIdUsuario() throws ErrorTienda {

        int Id = 0;
        ResultSet rs;
        PreparedStatement ps;
        try {
            cn.Conectar();
            ps = cn.BuscarIdMax("IdUsuario", "Usuario");
            rs = ps.executeQuery();
            while (rs.next()) {
                Id = rs.getInt(1);
            }
        } catch (Exception e) {
            throw new ErrorTienda("Error al obtener el IdUsuario", e.getMessage());
        }
        return Id;
    }

    public ControladorUsuario() {

    }
    
}
