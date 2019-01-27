<%-- 
    Document   : send
    Created on : Jan 26, 2019, 9:21:38 AM
    Author     : munikotivijaykumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.Properties" %>
<%@page import="javax.mail.*"  %>
<%@page import="javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            public static class SMTPAuthenticator extends Authenticator{
            
            public  PasswordAuthentication getpassAuthentication(){
                return new PasswordAuthentication("munikotivijaykumar","a+b()2@v");
                }
            }
            


            %>
            
            
            <%
                int result=0;
                if(request.getParameter("send")!=null){
                    
                   String  s_user="munikotivijaykumar";
                   String s_password="a+b()2@v";
                   String s_host="smtp.gmail.com";
                   int s_port=465;
                   
                   
                   String mail_to=request.getParameter("to");
                   String mail_from="munikotivijaykumar@gmail.com";
                   String mail_subject =request.getParameter("subject");
                   String mail_text =request.getParameter("message");
                   
                   
                   Properties prop= new Properties();
                   
                   
                   SMTPAuthenticator auth= new SMTPAuthenticator();
                   
                   Session ses=Session.getInstance(prop,auth);
                   
                   MimeMessage mes=new MimeMessage(ses);
                   mes.setContent(mail_text, "text/html");
                   mes.setSubject(mail_subject);
                   mes.setFrom(new InternetAddress(mail_from));
                   mes.addRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
                   
                   try{
                       Transport tans=ses.getTransport("smtps");
                       tans.connect(s_host,s_port,s_user,s_password);
                       tans.sendMessage(mes,mes.getAllRecipients());
                       tans.close();
                       result=1;
                       out.println("mail send");
                       
                   }catch(Exception e){
                       out.println(e);
                      e.printStackTrace();
                   }
                   
                   
                }
                %>
    </body>
</html>
