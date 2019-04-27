<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*,java.util.*, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title>XFactor</title>
        <style>
            body {
               margin:15px;
            }
        </style>
    </head>
    <body>
    <% try {
            String connURL = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=gottardo.joshua;password=xxx123#";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(connURL);
                    
            String sqlUsers = "SELECT * FROM Sblendorio WHERE Username = '" + request.getParameter("username") + "' AND Password = '" + request.getParameter("password") + "'";
            
    
            Statement stmtUsers = connection.createStatement();
            ResultSet rsUsers = stmtUsers.executeQuery(sqlUsers);
            
            if (rsUsers.next()) { %>
                <h2>
                    Benvenuto <%= rsUsers.getString("Nome") %>
                </h2>
            <% } else { %>
                <script type="text/javascript">
                    alert('Utente non riconosciuto');
                </script>
            <%
            }
            rsUsers.close();
            connection.close();
        } catch (Exception e) {
            out.println(e);
        } %>
    </body>
</html>