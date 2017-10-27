package Clases;

import static Clases.ControladorProveedor.cn;
import connections.ListasTablas;
import connections.iList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ControladorBitacora {
    
  public static void agregarBitacora(Bitacora b) throws Exception{
      
        try {
            cn.Conectar();
            iList p = new iList(new ListasTablas("idbitacora",b.idBitacora));
            p.add(new ListasTablas("idUsuario", b.idUsuario));
            
            p.add(new ListasTablas("accion", b.accion));

            cn.AgregarRegistro("bitacora", p, false);

        } catch (Exception e) {
            throw new ErrorTienda("Class ControladorBitacora/Agregar", e.getMessage());
        }
  } 
     

      public static ArrayList<Bitacora> Obtener() throws ErrorTienda {
        String[] cm = new String[]{"idbitacora", "idUsuario", "fecha", "accion", };

        ArrayList<Object> listaBitacora = new ArrayList();
        try {
            cn.Conectar();
            PreparedStatement ps = cn.BuscarTodos("bitacora", cm);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                listaBitacora.add(rs.getString("idbitacora"));
                listaBitacora.add(rs.getString("idUsuario"));
                
                listaBitacora.add(rs.getString("fecha"));
                listaBitacora.add(rs.getString("accion"));

            }
            cn.Desconectar();
        } catch (Exception e) {
            throw new ErrorTienda("Class ControladorBitacora/Obtener", e.getMessage());
        }
        ArrayList<Bitacora> listaBitacoras = (ArrayList) listaBitacora;
        return listaBitacoras;
    }
  
      public static ArrayList<Bitacora> Buscar(String buscar) throws ErrorTienda {

        if (buscar.isEmpty()) {
            //SI ESTA VACIO LLENAR TODO
            System.out.println("buscar = " + buscar);
            String[] cm = new String[]{"idbitacora", "idUsuario", "fecha","accion"};
            ArrayList<Object> bitacora = new ArrayList();
            try {
                cn.Conectar();
                PreparedStatement ps = cn.BuscarTodos("bitacora", cm);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {

                    bitacora.add(rs.getString("idbitacora"));
                    bitacora.add(rs.getString("idUsuario"));
                    bitacora.add(rs.getString("fecha"));
                    bitacora.add(rs.getString("accion"));
                    
                }
                cn.Desconectar();
            } catch (Exception e) {
                throw new ErrorTienda("Class ControladorBitacora/BuscarIF", e.getMessage());
            }
            ArrayList<Bitacora> Bitacoras= (ArrayList) bitacora;
            return Bitacoras;

        } else {
            ArrayList<Object> bitacora = new ArrayList();
            System.out.println("buscar = " + buscar);
            try {
                cn.Conectar();
                PreparedStatement ps = cn.BuscarRegistroLike("bitacora", "accion", buscar);
                System.out.println("ps " + ps.toString());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    bitacora.add(rs.getString("idbitacora"));
                    bitacora.add(rs.getString("idUsuario"));
                    bitacora.add(rs.getString("fecha"));
                    bitacora.add(rs.getString("accion"));
                }
                cn.Desconectar();
            } catch (Exception e) {
                throw new ErrorTienda("Class ControladorBitacora/BuscarELSE ", e.getMessage());
            }
            ArrayList<Bitacora> Bitacoras = (ArrayList) bitacora;
            return Bitacoras;
        }
      }
       
       public static void eliminarBitacora(Bitacora b) throws ErrorTienda {
        try {
            cn.Conectar();
            iList p = new iList(new ListasTablas("idbitacora", b.idBitacora));

            cn.Eliminar("bitacora", p);

        } catch (Exception e) {
            throw new ErrorTienda("Class ControladorSucursal/Eliminar", e.getMessage());
        }

    }
       
       public static int ObtenerIdBitacora() throws ErrorTienda {

        int Id = 0;
        ResultSet rs;
        PreparedStatement ps;
        try {

            cn.Conectar();
            ps = cn.BuscarIdMax("idbitacora", "bitacora");
            rs = ps.executeQuery();
            while (rs.next()) {
                Id = rs.getInt(1);
            }

        } catch (Exception e) {
            throw new ErrorTienda("Error al obtener el IdBitacora", e.getMessage());
        }
        return Id;
    }

}