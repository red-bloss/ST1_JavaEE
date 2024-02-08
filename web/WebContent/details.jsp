<%@ page import="java.util.ArrayList" %>
<%@ page import="classes.Tasks" %><%--
  Created by IntelliJ IDEA.
  User: VivoBook
  Date: 07.02.2024
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp" %>
<body>
<%@include file="/vendor/navbar.jsp" %>
<div class="container mt-3">
    <div class="row">
        <%Tasks task = (Tasks) request.getAttribute("zadacha");
        if(task != null){
            %>
        <div class="col">
            <form action="/updateTask" method="get">
            <label class="form-label">Наименование:</label>
            <input type="text" name="name" class="form-control" readonly value="<%=task.getName()%>">
            <label class="form-label">Описание:</label>
            <textarea name="description" class="form-control" rows="3" readonly><%=task.getDescription()%></textarea>
            <label class="form-label">Крайний срок:</label>
            <input type="date" name="deadline" class="form-control" readonly value="<%=task.getDeadlineDate()%>">
            <label class="form-label">Выполнено:</label>
            <select id="status" class="form-select">
                <option value="true" <%= task.isStatus() ? "selected" : "" %>>true</option>
                <option value="false" <%= !task.isStatus() ? "selected" : "" %>>false</option>
            </select>
            <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Сохранить</button>
            </form>
        </div>
        <%
        }
        %>

    </div>

    <div class="row mt-4">
        <div class="col">
            <form action="/deleteTask" method="get">
            <button type="submit" class="btn btn-danger">Удалить</button>
            </form>
        </div>
    </div>



</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
