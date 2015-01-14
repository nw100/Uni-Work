<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %>
<%
        String firstname = request.getParameter("firstname");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");

		if(firstname == null || surname == null || email == null){
		out.println("You must fill in the required fields.");
		}

        try {
			Context i = new InitialContext();
			Context e = (Context) i.lookup("java:/comp/env");
			DataSource d = (DataSource) e.lookup("jdbc/copperspoonDB");
			Connection con = d.getConnection();
			Statement st = con.createStatement();
		
            String stmt = "INSERT INTO mailing (firstname, surname, email) VALUES (?,?,?)";
PreparedStatement preparedStatement = con.prepareStatement(stmt);
preparedStatement.setString(1, firstname);
preparedStatement.setString(2,surname);
preparedStatement.setString(3,email);
preparedStatement.executeUpdate();
            preparedStatement.clearParameters(); 

             preparedStatement.close();
             con.close();
        } 
		
		catch (Exception ex) { 
		     out.println("Error.."+ex);
		}

        response.sendRedirect("email.jsp");
%>

