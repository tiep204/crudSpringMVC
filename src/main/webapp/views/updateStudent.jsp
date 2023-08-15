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
    <title>Update Student</title>
    <style>
        /* ... (CSS code remains the same) ... */
    </style>
</head>
<body>
<h1>Update Student</h1>
<div class="container">
    <form action="<%=request.getContextPath()%>/studentController/update" method="post">
        <table>
            <thead>
            <tr>
                <th>Field</th>
                <th>Value</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>StudentId:</td>
                <td><input type="hidden" name="id" value="${updateStudent.id}">${updateStudent.id}</td>
            </tr>
            <tr>
                <td>StudentName:</td>
                <td><input type="text" name="name" value="${updateStudent.name}"></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td><input type="number" name="age" value="${updateStudent.age}"></td>
            </tr>
            <tr>
                <td>Sex:</td>
                <td>
                    <select name="sex">
                        <option value="true" ${updateStudent.sex ? 'selected' : ''}>Nam</option>
                        <option value="false" ${!updateStudent.sex ? 'selected' : ''}>Nữ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address" value="${updateStudent.address}"></td>
            </tr>
            <tr>
                <td>BirthDate:</td>
                <td><input type="date" name="birthDate" value="${updateStudent.birthDate}"/></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td>
                    <select name="status">
                        <option value="true" ${updateStudent.status ? 'selected' : ''}>Hoạt động</option>
                        <option value="false" ${!updateStudent.status ? 'selected' : ''}>Không hoạt động</option>
                    </select>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2">
                    <input type="submit" value="update">
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</body>
</html>
