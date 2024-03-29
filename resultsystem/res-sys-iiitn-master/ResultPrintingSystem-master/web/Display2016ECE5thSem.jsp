<%-- 
    Document   : DisplayECE5thSem
    Created on : Feb 9, 2019, 5:13:13 PM
    Author     : ACER
--%>


<%@page import="Classes.CommonString"%>
<%@page import="DAO.DBAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="Classes.derivative"%>
<%@page import="Classes.Course"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="img/IIITNLogo.png" rel="icon"><!--iiitn logo-->
    <link href="img/IIITNLogo.png" rel="apple-touch-icon">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.css"></script>
    <link rel="stylesheet" href="css/display.css">
    <title>Result</title>
    <script type="text/javascript">
        function print_page() 
        {
            var ButtonControl = document.getElementById("btnprint");
            var ButtonBack=document.getElementById("btnback");
            ButtonControl.style.visibility = "hidden";
            ButtonBack.style.visibility="hidden";
            window.print();
            ButtonControl.style.visibility = "visible";
            ButtonBack.style.visibility="visible";
        }
        function back()
        {
            window.location.replace("Dashboard.jsp"); 
        }
        
    </script>
   <style type="text/css" media="all">
.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

#watermark
{
 position:fixed;
 bottom:5px;
 right:5px;
 opacity:0.5;
 z-index:99;
 color:white;
}

</style>
  </head>
  <body style="padding: 50px 50px 50px 50px;">
       <div id="watermark"><img style="height:90px;width: 90px;" src="img/IIITNLogo.png" alt="IIIT Nagpur"></div>
      
     
       <%
          response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
          response.setHeader("Pragma","no-cache");
          response.setHeader("Expires","0");
          
          if(session.getAttribute("enrollmentid")==null)
          {
              response.sendRedirect("Dashboard.jsp");
          }
          
      %>
    <center>
    <div class="container-fluid">
        <center>
        <div class="jumbotron">
        <div style="float:left"><img style="height:90px;width: 90px;" src="img/IIITNLogo.png" alt="IIIT Nagpur"></div>
        <div>
            <h3><b>भारतीय सूचना प्रौद्योगिकी संस्थान,नागपुर 
           <br>Indian Institute Of Information Technology,Nagpur</b></h3>
        </div>
        </div>
        </center>
        
        <center style="color:red"><h5><b>अनंतिम सत्र  ग्रेड रिपोर्ट /PROVISIONAL SEMESTER GRADE REPORT</b></h5></center>
       <table class="table table-bordered">
        <thead>
          <tr>
             <%  int sem=Integer.parseInt(session.getAttribute("semester").toString());
                  String str=session.getAttribute("enrollmentid").toString();
                          char str1=str.charAt(2);
                        char str2=str.charAt(3);
                        String st="20"+str1+str2;
                        int session_year=Integer.parseInt(st);
                       
                        session_year+=(sem)/2;
                  %>
            <th><b>Session:</b>July-December <%=session_year %></th>
            <th><b>दिनांक /Date:</b><%=new SimpleDateFormat("dd/MM/yyyy").format( new Date())%></th>
          </tr>
        </thead>
        </table>

      <table class="table table-bordered">
        <thead>
          <tr>
            <th>छात्र / छात्रा का नाम<br>Student Name</th>
            <th>रोल नंबर<br>Roll Number</th>
            <th>सत्र<br>Semester</th>
            <th>वर्ष<br>Year</th>
            <th>विभाग कोड<br>Department Code</th>
          </tr>
        </thead>
        <tbody>
          <tr>
      <% 
           DBAO conObj=new DBAO();
            Connection con=conObj.connectToDataBase();
            if(con!=null)
            {
                String query="SELECT ece.*,ece_sem5.s1,ece_sem5.g1, ece_sem5.s2,ece_sem5.g2, ece_sem5.s3,ece_sem5.g3, ece_sem5.s4,ece_sem5.g4, ece_sem5.s5,ece_sem5.g5, ece_sem4.s1,ece_sem4.g1, ece_sem4.s2,ece_sem4.g2, ece_sem4.s3,ece_sem4.g3, ece_sem4.s4,ece_sem4.g4, ece_sem4.s5,ece_sem4.g5, ece_sem4.s6,ece_sem4.g6, ece_sem4.s7,ece_sem4.g7, ece_sem3.s1,ece_sem3.g1, ece_sem3.s2,ece_sem3.g2, ece_sem3.s3,ece_sem3.g3, ece_sem3.s4,ece_sem3.g4, ece_sem3.s5,ece_sem3.g5, ece_sem3.s6,ece_sem3.g6, ece_sem3.s7,ece_sem3.g7, ece_sem2.s1,ece_sem2.g1, ece_sem2.s2,ece_sem2.g2, ece_sem2.s3,ece_sem2.g3, ece_sem2.s4,ece_sem2.g4, ece_sem2.s5,ece_sem2.g5, ece_sem2.s6,ece_sem2.g6, ece_sem2.s7,ece_sem2.g7, ece_sem1.s1,ece_sem1.g1, ece_sem1.s2,ece_sem1.g2, ece_sem1.s3,ece_sem1.g3, ece_sem1.s4,ece_sem1.g4, ece_sem1.s5,ece_sem1.g5, ece_sem1.s6,ece_sem1.g6 FROM ece,ece_sem4,ece_sem3,ece_sem2,ece_sem1 WHERE ece.enrollmentid=? AND ece_sem5.enrollmentid=? AND ece_sem4.enrollmentid=? AND ece_sem3.enrollmentid=? AND ece_sem2.enrollmentid=? AND ece_sem1.enrollmentid=?";
                String enrollmentid=session.getAttribute("enrollmentid").toString();
                String departmentCode=session.getAttribute("department").toString();
                String semester=session.getAttribute("semester").toString();
                CommonString s=new CommonString();
                Course c=new Course();
                derivative d=new derivative();
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    PreparedStatement ps=con.prepareStatement(query);
                    ps.setString(1,enrollmentid);
                    ps.setString(2,enrollmentid);
                    ps.setString(3,enrollmentid);
                    ps.setString(4,enrollmentid);
                    ps.setString(5,enrollmentid);
                    ps.setString(6,enrollmentid);


                    ResultSet rs=ps.executeQuery();
                    if(!rs.next())
                    {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Enrollment ID incorrect!');");
                        out.println("window.location.assign('Dashboard.jsp')");
                        out.println("</script>");
                        //out.println("<meta http-equiv='refresh' content='3;URL=Dashboard.jsp'>");//redirects after 3 seconds
                       //out.println("<p style='color:red;'>Enrollment ID incorrect!</p>");
                    }
                    else
                    { 
                %>


                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=semester%></td>
                <td><%=d.semToyear(semester)%></td>
                <td><%=departmentCode%></td>
              </tr>
            </tbody>
          </table>

          <table class="table table-bordered">
            <thead>
              <tr>
                  <th>कार्यक्रम/Program:<%="Bachelor of Technology"%></th>
              </tr>
              <tr>
                  <th>विभाग/Department :<%=d.dcToDn(departmentCode)%></th>
              </tr>
            </thead>
          </table>

          <table class="table table-bordered">
            <thead>
              <tr>
                <th>पाठ्यक्रम क्रमांक <br>Course Number</th>
                <th>पाठ्यक्रम नाम <br>Course Name</th>
                <th>पाठ्यक्रम आंक <br>Course Credit</th>
                <th>अर्जित ग्रेड <br>Grade Obtained</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><%=rs.getString(3)%></td>
                <td><%= c.getCourseName(rs.getString(3),s.getCourseFilePath())%></td>
                <td><%=c.getCourseCredit(rs.getString(3),s.getCourseFilePath())%></td>
                <td><%=rs.getString(4)%></td>
              </tr>
              <tr>
                 <td><%=rs.getString(5)%></td>
                <td><%= c.getCourseName(rs.getString(5),s.getCourseFilePath())%></td>
                <td><%=c.getCourseCredit(rs.getString(5),s.getCourseFilePath())%></td>
                <td><%=rs.getString(6)%></td>
              </tr>
              <tr>
                <td><%=rs.getString(7)%></td>
                <td><%= c.getCourseName(rs.getString(7),s.getCourseFilePath())%></td>
                <td><%=c.getCourseCredit(rs.getString(7),s.getCourseFilePath())%></td>
                <td><%=rs.getString(8)%></td>
              </tr>
              <tr>
                <td><%=rs.getString(9)%></td>
                <td><%= c.getCourseName(rs.getString(9),s.getCourseFilePath())%></td>
                <td><%=c.getCourseCredit(rs.getString(9),s.getCourseFilePath())%></td>
                <td><%=rs.getString(10)%></td>
              </tr>

              <tr>
                <td><%=rs.getString(11)%></td>
                <td><%= c.getCourseName(rs.getString(11),s.getCourseFilePath())%></td>
                <td><%=c.getCourseCredit(rs.getString(11),s.getCourseFilePath())%></td>
                <td><%=rs.getString(12)%></td>
              </tr>
            
            </tbody>
          </table>

          <table class="table table-bordered">
                <thead>
                  <tr><th>टिप्पणी/Remarks: PROVISIONAL</th></tr>
                </thead>
          </table>

          <table class="table table-bordered">
            <thead>
              <tr>
                <th colspan="3"><center>चालु सत्र प्रदर्शन<br>Current Semester Performance</center></th>
                <th colspan="3"><center>संचित प्रदर्शन<br>Cumulative Performance</center></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>कुल पंजीकृत अंक<br>Total Credit Registered</td>
                <td>ग्रेड पॉइंट<br>Grade Points</td>
                <td>एसजीपीए<br>SGPA</td>
                <td>कुल पंजीकृत अंक <br>Total Credit Registered</td>
                <td>ग्रेड पॉइंट<br>Grade Points</td>
                <td>सीजीपीए<br>CGPA</td>
              </tr>
              <tr>
                 <%
                    float totalc=0;
                    int j=3;
                    for(int i=0;i<5;i++)
                    {
                        totalc=totalc+c.getCourseCredit(rs.getString(j),s.getCourseFilePath());
                        j=j+2;
                    }
                %>
                <td><%=totalc%></td>
                <%
                    float gradePoint=0;
                    int j1=3;
                    int j2=4;
                    for(int i=0;i<5;i++)
                    {
                        gradePoint=gradePoint+c.getCourseCredit(rs.getString(j1),s.getCourseFilePath())*d.gradeToGradePoint(rs.getString(j2));
                        j1=j1+2;
                        j2=j2+2;
                    }

                %>
                <td><%=gradePoint%></td>
                <%
                    float sgpa=gradePoint/totalc;
                %>
                <td><%=String.format("%.02f", sgpa)%></td>
                 <%
                    float totalcc=0;
                    j=3;
                    for(int i=0;i<32;i++)
                    {
                        totalcc=totalcc+c.getCourseCredit(rs.getString(j),s.getCourseFilePath());
                        j=j+2;
                    }
                %>
                <td><%=totalcc%></td>
                  <%
                    float gradePointc=0;
                    j1=3;
                    j2=4;
                    for(int i=0;i<32;i++)
                    {
                        gradePointc=gradePointc+c.getCourseCredit(rs.getString(j1),s.getCourseFilePath())*d.gradeToGradePoint(rs.getString(j2));
                        j1=j1+2;
                        j2=j2+2;
                    }

                %>
                <td><%=gradePointc%></td>
                <%
                    float cgpa=gradePointc/totalcc;
                %>
                <td><%=String.format("%.02f", cgpa)%></td>
              </tr>
            </tbody>
          </table>
              <br>
              <div class="container-fluid" style="float:right">परीक्षा नियंत्रक<br>Exam Controller</div>
              <br>

        </div>
                <input type="button" id="btnprint" value="Print" onclick="print_page()" class="button"/>
                <input type="button" id="btnback"  value="Back" onclick="back()" class="button"/>
        </center>

      </body>
    </html>
    <% } %>
    <%

    rs.close();
    ps.close();
    con.close();
    } 

    catch(Exception ex)
    {
        ex.printStackTrace();
    }
}
else
{
    response.sendRedirect("SERVER_ERR.html");
}

    %>

