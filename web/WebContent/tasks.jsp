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
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#tasks">
        + Добавить задание
    </button>

    <!-- Modal -->
    <div class="modal fade" id="tasks" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="/addTask" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Новое задание</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                        <label class="form-label">Наименование:</label>
                        <input type="text" name="name" class="form-control">
                        <label class="form-label">Описание:</label>
                        <textarea name="description" class="form-control">Описание...</textarea>
                        <label class="form-label">Крайний срок:</label>
                        <input type="date" name="deadline" class="form-control">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                    <button type="submit" class="btn btn-primary">Добавить задание</button>
                </div>
            </div>
            </form>
        </div>

    </div>
    <table class="table mt-3">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование</th>
            <th scope="col">Крайний срок</th>
            <th scope="col">Выполненено</th>
            <th scope="col">Детали</th>
        </tr>
        </thead>
        <tbody>
        <% ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("task");
            if(tasks != null){
                for(Tasks task: tasks) {
        %>
        <tr>
            <td><%=task.getId()%></td>
            <td><%=task.getName()%></td>
            <td><%=task.getDeadlineDate()%></td>
            <td><%=task.isStatus()%></td>
            <td><a class="btn btn-small btn-primary" href="/details?id=<%=task.getId()%>">Детали</a></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
