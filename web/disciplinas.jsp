<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 17:52:16
    Author     : Maurício
--%>

<%@page import="model.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String exceptionMessage = null;
    if(request.getParameter("Cancelar")!=null){
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("FormInsert")!=null){
        try{
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            Float nota = Float.parseFloat(request.getParameter("nota"));
            Disciplina.insertDiscplina(nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormUpdate")!=null){
        try{
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            Float nota = Float.parseFloat(request.getParameter("nota"));
            Disciplina.updateDisciplina(nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormDelete")!=null){
        try{
            String nome = request.getParameter("nome");
            Disciplina.delete(nome);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
%>
<!DOCTYPE html>
<%if(request.getParameter("prepareInsert")!=null){%>
    <h3>Inserir registro</h3>
    <form>
        Disciplina: <input type="text" name="nome" />
        Ementa: <input type="text" name="ementa"/>
        Ciclo:  <input type="text" name="ciclo"/>
        Nota: <input type="number" name="nota"/>    
        <input type="submit" name="FormInsert" value="Inserir"/>
        <input type="submit" name="Cancelar" value="Cancelar"/>
    </form>
<%}else if(request.getParameter("preprarUpdate")!=null){%>
    <h3>Alterar registro</h3>
    <form>
        <%
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            String ciclo = request.getParameter("ciclo");
            String nota = request.getParameter("nota");
        %>
        Nome:<input type="text" name="nome" value="<%= nome %>"/>
        Ementa: <input type="text" name="ementa" value="<%= ementa %>"/>
        Ciclo: <input type="number" name="ciclo" value="<%= ciclo %>"/>
        Nota: <input name="nota" type="number" value="<%= nota %>"/>
        <input type="submit" name="FormUpdate" value="Alterar"/>
        <input type="submit" name="Cancelar" value="Cancelar"/>
    </form>
            <%}else if(request.getParameter("preprarDelete")!=null){%>
                <h3>Excluir registro</h3>
                <form>
                    <% String nome = request.getParameter("nome"); %>
                    <input type="hidden" name="nome" value="<%= nome %>"/>
                    Excluir o registro <b><%= nome %></b>?
                    <input type="submit" name="FormDelete" value="Excluir"/>
                    <input type="submit" name="Cancelar" value="Cancelar"/>
                </form>
            <%}else{%>
                <form method="post">
                    <input type="submit" name="prepareInsert" value="Inserir"/>
                </form>
            <%}%>   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="menu.jspf"%>
        <table border="1">
                <tr>
                    <th>Nome</th>
                    <th>Ementa</th>
                    <th>Ciclo</th>
                    <th>Nota</th>
                </tr>
                <%for(Disciplina t: Disciplina.getList()){%>
                <tr>
                    <td><%= t.getNome() %></td>
                    <td><%= t.getEmenta() %></td>
                    <td><%= t.getCiclo()%></td>
                    <td><%= t.getNota()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="nome" value="<%= t.getNome() %>"/>
                            <input type="hidden" name="ementa" value="<%= t.getEmenta() %>"/>
                            <input type="hidden" name="ciclo" value="<%= t.getCiclo() %>"/>
                            <input type="hidden" name="nota" value="<%= t.getNota() %>"/>
                            <input type="submit" name="preprarUpdate" value="Alterar"/>
                            <input type="submit" name="preprarDelete" value="Excluir"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
    </body>
</html>
