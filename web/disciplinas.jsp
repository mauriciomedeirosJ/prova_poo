<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 17:52:16
    Author     : Maurício
--%>

<%@page import="model.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
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
                            <input type="hidden" name="descricao" value="<%= t.getNome() %>"/>
                            <input type="hidden" name="categoria" value="<%= t.getEmenta() %>"/>
                            <input type="hidden" name="origem" value="<%= t.getCiclo() %>"/>
                            <input type="hidden" name="valor" value="<%= t.getNota() %>"/>
                            <input type="submit" name="preprarUpdate" value="Alterar"/>
                            <input type="submit" name="preprarDelete" value="Excluir"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
    </body>
</html>
