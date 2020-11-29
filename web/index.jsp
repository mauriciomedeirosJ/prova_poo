<%-- 
    Document   : index
    Created on : 5 de out de 2020, 17:39:38
    Author     : Maurício
--%>

<%@page import="model.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="menu.jspf"%>
        
        <h1>
            RA: 1290481913027
            <br>
            Nome: Maurício Medeiros de Jesus
        </h1>
        <br>
        <h3> Quantidade de disciplinas cursadas no 4 semestre: <%=Disciplina.getList().size()%></h3>

    </body>
</html>
