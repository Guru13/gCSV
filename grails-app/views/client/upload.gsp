<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Upload</title>
    <g:javascript library="jquery" />
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="upload-data" class="content scaffold-create" role="main">
    <div class="content scaffold-create" role="main">
        <h1>Upload Data</h1>
        <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
        <g:uploadForm action="doUpload">
            <fieldset class="form">
                <input type="file" name="file" />
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="doUpload" value="Upload" />
                %{--<button onclick="<g:remoteFunction controller="client" action="count" update="upload-data"/>">Count</button>--}%
                %{--<g:submitToRemote url="[controller:'client', action:'doUpload']" update="upload-data" name="doUpload" value="Upload"/>--}%
            </fieldset>
        </g:uploadForm>
    </div>
</div>


</body>
</html>