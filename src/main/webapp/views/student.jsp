<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: tiepd
  Date: 14/08/2023
  Time: 10:19 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        .container {
            margin: 20px auto;
            width: 80%;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #e7a5a5;
        }

        th {
            background-color: #f2f2f2;
        }

        th[colspan="2"], td[colspan="2"] {
            text-align: center;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        .action-links {
            text-align: center;
        }

        .action-links a {
            margin-right: 10px;
        }

        .action-links a:last-child {
            margin-right: 0;
        }
    </style>
</head>
<body>
<h1>List Student</h1>
<div class="container">
    <a href="/studentController/add">Create</a>
    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>StudentId</th>
            <th>StudentName</th>
            <th>Age</th>
            <th>Sex</th>
            <th>Address</th>
            <th>BirthDate</th>
            <th>Status</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="st" varStatus="student">
            <tr>
                <td>${student.count}</td>
                <td>${st.id}</td>
                <td>${st.name}</td>
                <td>${st.age}</td>
                <td>${st.sex ? "Nam" : "Nữ"}</td>
                <td>${st.address}</td>
                <td><fmt:formatDate value="${st.birthDate}" pattern="dd/MM/yyyy"/></td>
                <td>${st.status ? "Hoạt động" : "Không hoạt động"}</td>
                <td class="action-links">
                    <a href="<%=request.getContextPath()%>/studentController/update?id=${st.id}">Update</a>
                    <a onclick="return confirm('Bạn có chắc chắn muốn xóa không?')" href="<%=request.getContextPath()%>/studentController/delete?id=${st.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>


