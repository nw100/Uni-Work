<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
   String result;

   String to = "nw13747@my.bristol.ac.uk";

   String from = "nw13747@my.bristol.ac.uk";
	String pass = "********";
   String host = "smtp.gmail.com";

   Properties props = System.getProperties();

  
   props.put("mail.smtp.starttls.enable", "true"); // added this line
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.user", from);
	props.put("mail.smtp.password", pass);
	props.put("mail.smtp.port", "587");
	props.put("mail.smtp.auth", "true");

   // Get the default Session object.
   Session mailSession = Session.getDefaultInstance(props, null);

   try{
      MimeMessage message = new MimeMessage(mailSession);
      message.setFrom(new InternetAddress(from));
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      message.setSubject("Thanks for signing up!");

      message.setContent("<h1>The Copper Spoon</h1>	  <p>This email is just to confirm that you have succesfully joined our mailing list! You do not need to do anything, just sit back and wait for all the exciting content to be sent your way! </p>",
                            "text/html; charset=utf-8" );

      Transport transport = mailSession.getTransport("smtp");
	  transport.connect(host, from, pass);
	  transport.sendMessage(message, message.getAllRecipients());
	  transport.close();
      result = "You should receive a confirmation email very shortly.";
   }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
   
   out.println(result + "\n");
%>