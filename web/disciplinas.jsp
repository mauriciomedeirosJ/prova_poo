<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 17:52:16
    Author     : Maurício
--%>

<%@page import="POO.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ArrayList<Disciplina> disciplinas = (ArrayList) application.getAttribute("disciplinas");
    if (disciplinas == null) {
        disciplinas = new ArrayList();
        disciplinas.add(new Disciplina("Metodologia", "Conceitos de metodologia", 2));
        disciplinas.add(new Disciplina("POO", "Conceitos de orientacao a objeto", 4));
        disciplinas.add(new Disciplina("Programacao web", "Conceitos de programacao web", 3));
        disciplinas.add(new Disciplina("Banco de dados", "Conceitos de banco de dados", 4));
        application.setAttribute("disciplinas", disciplinas);
    }
    if (request.getParameter("add") != null) {
        int i = Integer.parseInt(request.getParameter("i"));
        disciplinas.get(i).setNota(Float.parseFloat(request.getParameter("nota")));
        response.sendRedirect(request.getRequestURI());
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Ementa</th>
                    <th scope="col">Nota</th>
                </tr>
            </thead>
            <tbody>
                <%

                    for (int i = 0; i < disciplinas.size(); i++) {
                %>
                <tr>
                    <th scope="row"><%= i + 1%></th>
                    <td><%=disciplinas.get(i).getNome()%></td>
                    <td><%=disciplinas.get(i).getEmenta()%></td>
                    <td><%=disciplinas.get(i).getNota()%></td>
                    <td><form>
                            <input type="number" name="nota" max="10" min="0"/>
                            <input type="submit" name="add" value="Alterar valor"/>
                            <input type="hidden" name="i" value="<%=i%>"/>
                        </form></td>
                </tr>

                <%}%>


            </tbody>
        </table>
    </body>
</html>
