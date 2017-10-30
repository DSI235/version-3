/*
 * Conexion Base De Datos
 */
package connections;

import java.sql.*;
import javax.swing.JOptionPane;

public class conection extends ClaseConexion {

    public conection() {

    }

    private String password = "";
    private String usuario = "root";
    private String direccionServidor = "localhost";
    private String nombreBaseDatos = "tiendav2";
    private String puerto = "3306";
    //vizcarra
    private String url = "jdbc:mysql://localhost:3306/tiendav2";
    private Connection cnx = null;
    private Statement sttm = null;
    private ResultSet rst = null;
    //vizcarra//

    @Override
    public void CrearConexion() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + nombreBaseDatos, usuario, password);
        System.out.println(":)");
    }

    public Connection getConexion() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + nombreBaseDatos, usuario, password);
        System.out.println(":)");
        return con;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setDireccionServidor(String direccionServidor) {
        this.direccionServidor = direccionServidor;
    }

    public void setNombreBaseDatos(String nombreBaseDatos) {
        this.nombreBaseDatos = nombreBaseDatos;
    }

    public void setPuerto(String puerto) {
        this.puerto = puerto;
    }

    //vizcarra
    public void UID(String sql) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection(url, usuario, password);
            sttm = cnx.createStatement();
            sttm.executeUpdate(sql); //statement
          
        } catch (ClassNotFoundException c) {
            JOptionPane.showMessageDialog(null, "ERROR: " + c.getMessage());
            System.exit(1); //salir de aplicación
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e.getMessage());
            System.exit(1);
        }
    }
     //Método para Consultar
    public ResultSet getValores(String sql) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnx = DriverManager.getConnection(url, usuario, password);
            sttm = cnx.createStatement();
            rst = sttm.executeQuery(sql);  //resultset
        } catch (ClassNotFoundException c) {
            JOptionPane.showMessageDialog(null, "ERROR: " + c.getMessage());
            System.exit(1);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR: " + e.getMessage());
            System.exit(1);
        } finally {
            return rst;
        }
    }
    //vizcarra
    
}
