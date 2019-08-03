/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.jc.model;

import java.sql.CallableStatement;
import java.sql.Connection;

/**
 *
 * @author campitos
 */
public class TestProcedimiento {
    public static void main(String args[])throws Exception{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
     CallableStatement callate=con.prepareCall("{call guardar_reg(?,?,?)}");
        callate.setInt(1, 5);
        callate.setString(2,"Pedro");
        callate.setInt(3,102);
      
        callate.execute();
      
        System.out.println("Registro guardado");
    }
    
}
