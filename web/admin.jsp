<%-- Include tag is used to import header page --%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="test.DbManager"%>
<%@ include file="header.jsp" %>
<%-- Code to display items in List --%>
<nav id="menu">
     <ul><%-- Added the EL tag ${email} to display the users email instead of static name--%>
            <li><a href="admin.jsp?user=Admin ${email}">Home</a></li>
            <li><a href="create_group.jsp?user= Admin ${email} ">Create Group</a></li>
     </ul>    <%--On clicking the Reported Question link it will be directed  to the reportques.jsp--%>
</nav>
<%-- Section tag is used to write description  --%>
<section class="main">
    <form action="GroupServlet" method="processRequest">
    <label>Search<label>
    <input type="text" name="search_group" >
    <input type="submit" value="Search" id="search_button" >
    </form>
    <br>
</section>
    <div id = "groupsManagement">
        <%
        DbManager db = new DbManager();
        java.sql.Connection conn = db.getConnection();
        if(conn == null)
        {
                out.print("Connection not established");
        }else
        {
                //out.print("Connection Established");
                String query="SELECT * FROM groups";
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(query);  

                while(rs.next())
                {

                %>
                <table>
                    <tr>
                        <td><input type="button" value="<%=rs.getString("g_name")%>" id="<%=rs.getString("g_name")%>" onclick="getToGroup('<%=rs.getString("g_name")%>')"></td>
                        <td><input type="button" value="Delete" id="<%=rs.getString("g_id")%>" onclick="Delete_row('<%=rs.getString("g_id")%>')"></td>
                    </tr>
                 <%}
        }
                %>
        </div>
    <script>
        function getToGroup(group_name)
        {
            window.location.href = group_name+".jsp";
        }
               
        function Delete_row(group_id)
        {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function()
            {
                if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    alert(xmlhttp.responseText);
                    location.reload(true);
                }
            };
            
            var params= "g_id="+group_id;
            xmlhttp.open("Post","/SSDI_Project/GroupServlet",true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send(params);
        }
    </script>
<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>
