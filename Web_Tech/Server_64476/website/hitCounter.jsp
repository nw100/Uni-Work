
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %>
<%
			
			Context i = new InitialContext();
			Context e = (Context) i.lookup("java:/comp/env");
			DataSource d = (DataSource) e.lookup("jdbc/copperspoonDB");
			Connection con = d.getConnection();
			Statement st = con.createStatement();
			try{
			ResultSet rs = st.executeQuery("select counter from hitCount");
			%>		

			<% while (rs.next()) {
				Integer hc = rs.getInt("counter");
			%>		

			<% if( hc == null || hc == 0 ){
				/* First visit */ %>
				<p id="counterID">Welcome to my website! <br/>
				<%
				st.executeUpdate("update hitCount SET counter = 1");
			}else{
				
				if(session.isNew()){%>
				<p id="counterID">Welcome to my website! <br/>
				<%
				st.executeUpdate("update hitCount SET counter = counter+1");				
				} else {
				/* return visit */%>
				<p id="counterID">Welcome back to my website!<br/>
				<%
				}
			}
			%>
			Total number of visits: <em>
					
				<%= hc %>
					
			</em></p>
			<% } %>			
			<% st.close(); 
			con.close(); 
			}catch(SQLException se){
				//Handle errors for JDBC
				se.printStackTrace();
			}catch(Exception ex){
				//Handle errors for Class.forName
				ex.printStackTrace();
			}finally{
				//finally block used to close resources
			try{
				if(st!=null)
					con.close();
			}catch(SQLException se){
			}// do nothing
			try{
				if(con!=null)
				con.close();
			}catch(SQLException se){
			se.printStackTrace();
      }//end finally try
   }//end try%>	