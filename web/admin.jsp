<%-- Include tag is used to import header page --%>
<%@ include file="header.jsp" %>
<%-- Code to display items in List --%>
<nav id="menu">
     <ul><%-- Added the EL tag ${email} to display the users email instead of static name--%>
            <li><a href="admin.jsp?user=Admin ${email}">Home</a></li>
            <li><a href="reportques.jsp?user= Admin ${email} ">Reported Questions</a></li>
     </ul>    <%--On clicking the Reported Question link it will be directed  to the reportques.jsp--%>
</nav>
<%-- Section tag is used to write description  --%>
<section class="main">
    <form action="GroupServlet" method="Post">
    <label>Search<label>
    <input type="text" name="search_group" >
    <input type="submit" value="Search" id="search_button" >
    </form>
    <br>
</section>
<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>