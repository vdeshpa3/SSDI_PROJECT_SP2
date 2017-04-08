<%-- 
    Document   : 49_uncc
    Created on : 26 Mar, 2017, 5:09:40 PM
    Author     : Viranchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="test.DbManager" %>

<!DOCTYPE html>

<%-- Include tag is used to import header page --%>
<%@ include file="header.jsp" %>

<nav id="menu">
     <ul><%-- Added the EL tag ${email} to display the users email instead of static name--%>
            <li><a href="admin.jsp?user=Admin ${email}">Home</a></li>
     </ul>    <%--On clicking the Reported Question link it will be directed  to the reportques.jsp--%>
</nav>

<section class="main">
    <%-- Img tag is used to import image --%>
             <center><h1>Uncc_49ers</h1><center>
             <hr>
        <input type="submit" value="Join" id="join_group_button" onClick="Join('Uncc_49ers')">
        <br>
        
        
</section>
<section class="main">
    <form action="NewPostsServlet" method="Post">
        <Label> What's on your mind</label>
    <input type="hidden" value="Uncc_49ers" name="group_name">
    <input type="text" id="text1" name="input1" required />    
    <input type="submit" value="Post" id="post_group_button" onClick="ShowText()">
    </form>
</section>
<section class="main">
    <div id="main">
        <table>
        <%
        DbManager db = new DbManager();
        java.sql.Connection conn = db.getConnection();
        if(conn == null)
        {
                out.print("Connection not established");
        }else
        {
                //out.print("Connection Established");
                String query="select p.post as post_text, p.post_id as post_id, u.u_name as uname, u.u_id as user_id from posts p, users u, post_user_group_relationship pug, groups g where p.post_id = pug.p_id and pug.u_id = u.u_id and pug.g_id = g.g_id and g.g_name = 'UNCC_49ers'";
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(query);  
                int i = 0;
                %>
                <th>Posts</th>
                <%
                while(rs.next())
                {
                    i++;
                %>
                    <tr>
                    <td><%=rs.getString("uname") %></td>
                    <td><%=rs.getString("post_text") %></td>
                    <td><input type="button" id="like_<%=i%>" value="Like" onclick="Insert_or_Delete('<%=rs.getInt("post_id") %>','user','<%=rs.getInt("user_id") %>','like_<%=i%>')"/></td>
                    </tr>
                 <%}
        }
                %>
        </table>
    </div>
</section>

    
             <script>

    function Join(group_name)
        {
            alert("Your request has been sent");
            document.getElementById("signup_button").value = "Request Sent";
        }
    
    function Insert_or_Delete(post_id,role,user_id,like_button_id)
    {
        var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function()
            {
                if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    if((xmlhttp.responseText) == "liked")
                    {
                        document.getElementById("like_button_id").innerHTML = "liked";
                    }
                    else if((xmlhttp.responseText) == "deleted")
                        document.getElementById("like_button_id").innerHTML = "deleted";
                }
            };
            
            var params= {"post_id":post_id,"role":role,"user_id":user_id};
            //var params= "g_id="+group_id;
            xmlhttp.open("Post","/SSDI_Project/InserOrDeleteServlet",true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send(params);
            //xmlhttp.send(param1);
            //xmlhttp.send(params2);
    }
    
    function ShowText()
    {
        //var post_group_button = document.getElementById("post_group_button").value;
        //var h = document.input1;
        //h.style.visibility="visible";
        document.getElementById("text1").style.visibility="visible";
        //document.getElementsByName("input1").style.visibility="visible";
        //document.getElementsByName("input1").style.display="block";
        //var h = document.input1;
          //h.style.visibility="visible";


//        document.getElementById("input1").style.visibility = "visible";
    }
        </script>
<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>

