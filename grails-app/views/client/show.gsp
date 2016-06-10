<%@ page import="by.guru13.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-client" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list client">
			
				<g:if test="${clientInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="client.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${clientInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="client.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clientInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="client.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${clientInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.zip}">
				<li class="fieldcontain">
					<span id="zip-label" class="property-label"><g:message code="client.zip.label" default="Zip" /></span>
					
						<span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${clientInstance}" field="zip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="client.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${clientInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="client.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${clientInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:clientInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${clientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
