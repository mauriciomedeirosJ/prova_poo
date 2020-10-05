/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POO;

import java.util.ArrayList;

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
        public ArrayList<Disciplina> getList(ArrayList<Disciplina> list, int semestre){
            ArrayList<Disciplina> lista_disciplinas= new ArrayList();
            for(int i=0; i<list.size();i++){
                if(list.get(i).getciclo()==semestre){
                    lista_disciplinas.add(list.get(i));
                }
            }
            return lista_disciplinas;
        }
        
        public String getNome(){
            return nome;
        }
        public String getEmenta(){
            return ementa;
        }
        public int getciclo(){
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
}
