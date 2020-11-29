/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author Maurício
 */
public class Disciplina {
        String nome, ementa;
        int ciclo;
        float nota;
        
        public Disciplina (String nome, String ementa, int ciclo){
            this.nome=nome;
            this.ementa=ementa;
            this.ciclo=ciclo;

        }
        
        public Disciplina (String nome, String ementa, int ciclo, float nota){
            this.nome=nome;
            this.ementa=ementa;
            this.ciclo=ciclo;
            this.nota=nota;
        }
        
        public static ArrayList<Disciplina> getList() throws Exception{
            ArrayList<Disciplina> list = new ArrayList<>();
            Connection con = null; Statement stmt = null; ResultSet rs = null;
            Exception methodException = null;
            try{
                con = DbListener.getConnection();
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM disciplinas");
                while(rs.next()){
                    list.add(new Disciplina(
                            rs.getString("nome"),
                            rs.getString("ementa"),
                            rs.getInt("ciclo"),
                            rs.getFloat("nota")
                    ));
                }
            }catch(Exception ex){
                methodException = ex;
            }finally{
                try{rs.close();}catch(Exception ex2){}
                try{stmt.close();}catch(Exception ex2){}
                try{con.close();}catch(Exception ex2){}
            }
            if(methodException!=null) throw methodException;
            return list;
        }
        public static void updateNota(String nome, float nota) throws Exception{
            Disciplina materia = null;
            Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
            Exception methodException = null;
            try{
                con = DbListener.getConnection();
                stmt = con.prepareStatement("UPDATE disciplinas SET nota = ? WHERE nome = ?");
                stmt.setFloat(1, nota);
                stmt.setString(2, nome);
                stmt.execute();
            }catch(Exception ex){
                methodException = ex;
            }finally{
                try{rs.close();}catch(Exception ex2){}
                try{stmt.close();}catch(Exception ex2){}
                try{con.close();}catch(Exception ex2){}
            }
            if(methodException!=null) throw methodException;
        }
        
        public static void insertDiscplina(String nome, String ementa, int ciclo, float nota) throws Exception{
            Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
            Exception methodException = null;
            try{
                con = DbListener.getConnection();
                stmt = con.prepareStatement("INSERT INTO disciplinas(nome, ementa, ciclo, nota) values(?,?,?,?)");
                stmt.setString(1, nome);
                stmt.setString(2, ementa);
                stmt.setInt(3, ciclo);
                stmt.setFloat(4, nota);      
                stmt.execute();
            }catch(Exception ex){
                methodException = ex;
            }finally{
                try{rs.close();}catch(Exception ex2){}
                try{stmt.close();}catch(Exception ex2){}
                try{con.close();}catch(Exception ex2){}
            }
            if(methodException!=null) throw methodException;
        }
        public static void delete(String nome) throws Exception{
            Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
            Exception methodException = null;
            try{
                con = DbListener.getConnection();
                stmt = con.prepareStatement("DELETE FROM disciplinas WHERE nome=?");
                stmt.setString(1, nome);
                stmt.execute();
            }catch(Exception ex){
                methodException = ex;
            }finally{
                try{rs.close();}catch(Exception ex2){}
                try{stmt.close();}catch(Exception ex2){}
                try{con.close();}catch(Exception ex2){}
            }
            if(methodException!=null) throw methodException;
        }
        public static Disciplina getDisciplina(String nome) throws Exception{
            Disciplina materia = null;
            Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
            Exception methodException = null;
            try{
                con = DbListener.getConnection();
                stmt = con.prepareStatement("SELECT * FROM disciplinas WHERE nome = ?");
                stmt.setString(1, nome);
                rs = stmt.executeQuery();
                while(rs.next()){
                    materia = new Disciplina(
                            rs.getString("nome"),
                            rs.getString("ementa"),
                            rs.getInt("ciclo"),
                            rs.getFloat("nota")
                    );
                }
            }catch(Exception ex){
                methodException = ex;
            }finally{
                try{rs.close();}catch(Exception ex2){}
                try{stmt.close();}catch(Exception ex2){}
                try{con.close();}catch(Exception ex2){}
            }
            if(methodException!=null) throw methodException;
            return materia;
        }

        public String getNome(){
            return nome;
        }
        public String getEmenta(){
            return ementa;
        }
        public int getCiclo(){
            return ciclo;
        }
        public float getNota(){
            return nota;
        }
        public void setNome(String nome){
            this.nome=nome;
        }
        public void setNota(float nota){
            this.nota=nota;
        }
        public void setciclo(int ciclo){
            this.ciclo=ciclo;
        }
        public void setEmenta(String ementa){
            this.ementa=ementa;
        }
        
        public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS disciplinas("
                + "nome VARCHAR(50) UNIQUE NOT NULL,"
                + "ementa VARCHAR(200) NOT NULL,"
                + "ciclo int(2) NOT NULL,"
                + "nota FLOAT(3,1) NOT NULL"
                + ")";
    }
}
