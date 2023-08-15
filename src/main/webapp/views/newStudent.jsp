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
    <title>Title</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/studentController/create" method="post">
    <table border="1" cellspacing="10" cellpadding="10">
        <tr>
            <td>StudentName</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>age</td>
            <td><input type="number" name="age"></td>
        </tr>
        <tr>
            <label for="sex">sex:</label>
            <select id="sex" name="sex">
                <option value="true">Nam</option>
                <option value="false">Nữ</option>
            </select>
        </tr>
        <tr>
            <td>Address</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td>birthDate</td>
            <td><input type="date" name="birthDate"></td>
        </tr>
        <label for="status">Status:</label>
        <select id="status" name="status">
            <option value="true">Hoạt động</option>
            <option value="false">Not Hoạt động</option>
        </select>
        <td>
            <input  type="submit" name="create">
        </td>
    </table>
</form>

</body>
</html>
