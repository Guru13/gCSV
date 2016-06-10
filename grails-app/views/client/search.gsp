
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Please enter an employee ID</title>
</head>

<body>
<div id="overall" style="padding: 20px 20px 20px 220px; float: left">
    <g:form controller="client" action="listClients" method="POST">
        <br>
        <br>
        <p>Client name:</p>
        <g:textField name="clientName" maxlength="30" />
        <br>
        <br>
        <p>Client email:</p>
        <g:textField name="clientEmail" maxlength="40" />
        <br>
        <br>
        <p>Client street:</p>
        <g:textField name="clientStreet" maxlength="60" />
        <br>
        <br>
        <p>Client zip:</p>
        <g:textField name="clientZip" maxlength="40" />
        <br>
        <br>
        <input value="Submit" type="submit">
    </g:form>
</div>
</body>
</html>