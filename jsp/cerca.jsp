<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*,java.util.*, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>XFactor</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
        body {
            margin: 15px;
        }
        .titolo {
            text-transform: uppercase;
        }
    </style>
    </head>
    <body>
    <% try {
            String connURL = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=gottardo.joshua;password=xxx123#";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(connURL);
                    
            String ricerca = request.getParameter("ricerca");
            
            String sqlRicerca = "SELECT * FROM Sblendorio WHERE " + request.getParameter("campo") + " LIKE ?";
            
            PreparedStatement stmtRicerca = connection.prepareStatement(sqlRicerca);
            stmtRicerca.setString(1, ricerca + "%");
            ResultSet rsRicerca = stmtRicerca.executeQuery();%>
            
	        <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Username</th>
                  </tr>
                </thead>
                <tbody>
                <% while(rsRicerca.next()){ %>
                <tr>
                    <td> <%= rsRicerca.getString("Nome") %> </td>
                    <td> <%= rsRicerca.getString("Cognome") %> </td>
                    <td> <%= rsRicerca.getString("Email") %> </td>
                    <td> <%= rsRicerca.getString("Username") %> </td>
                  </tr>
                  <% }%>
                </tbody>
              </table>
              <%
            rsRicerca.close();
            connection.close();
        } catch (Exception e) {
            out.println(e);
        } %>
    </body>
</html>