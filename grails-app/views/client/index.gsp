<%@ page import="by.guru13.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<g:javascript library="jquery"/>
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript">
			google.load('visualization', '1', {'packages': ['map']});
			google.setOnLoadCallback(drawVisualization);

			function drawVisualization() {
				visualization_data = new google.visualization.DataTable();
				visualization_data.addColumn('number', 'Lat');
				visualization_data.addColumn('number', 'Lng');
				visualization_data.addColumn('string', 'Name');

				var locations = '/gCSV/client/index.json?&max=20'
				$.getJSON(locations)
						.done(function (data) {
							$.each(data, function (i, loc) {
								visualization_data.addRow(
										[loc.latitude, loc.longitude, loc.name + "," + loc.street]
								);
							});
						});

				var options = {
					showTip: true,
					icons: {
						default: {
							normal: '/gCSV/images/marker4.png',
							selected: '/gCSV/images/marker4.png'
						}
					}
				};
				visualization = new google.visualization.Map(document.getElementById('map'));
				visualization.draw(visualization_data, options);
			}
		</script>
	</head>
	<body>
		<a href="#list-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-client" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div id="map" style="width:960px; height:400px">
			</div>

			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'client.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="street" title="${message(code: 'client.street.label', default: 'Street')}" />
					
						<g:sortableColumn property="zip" title="${message(code: 'client.zip.label', default: 'Zip')}" />
					
						<g:sortableColumn property="latitude" title="${message(code: 'client.latitude.label', default: 'Latitude')}" />
					
						<g:sortableColumn property="longitude" title="${message(code: 'client.longitude.label', default: 'Longitude')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: clientInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "street")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "zip")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "latitude")}</td>
					
						<td>${fieldValue(bean: clientInstance, field: "longitude")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clientInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
