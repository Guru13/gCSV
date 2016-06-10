<%@ page import="by.guru13.Client" %>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="client.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${clientInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="client.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${clientInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="client.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${clientInstance?.street}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'zip', 'error')} required">
	<label for="zip">
		<g:message code="client.zip.label" default="Zip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zip" required="" value="${clientInstance?.zip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="client.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${fieldValue(bean: clientInstance, field: 'latitude')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="client.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${fieldValue(bean: clientInstance, field: 'longitude')}" required=""/>
</div>

