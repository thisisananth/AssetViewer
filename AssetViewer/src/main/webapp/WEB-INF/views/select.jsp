<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Welcome to Asset Viewer.!! </h1>
	
	<h3>Please select a category and/or a genre to
		continue</h3>

	<form:form method="post" action="view">
		<form:errors path="*" element="div" />
		<table id="catTable">
			<tr>
				<th><label>Category:</label></th>
				<th><label>Genre:</label></th>
			</tr>

			<tr>

				<td><select name="categoryId">
						<option selected="selected" value="-1">Please select</option>
						<c:forEach items="${categories}" var="category">
							<option value="${category.key}">${category.value}</option>
						</c:forEach>

				</select></td>
				
				<td><select name="genreId">
						<option selected="selected" value="-1">Please select</option>
						<c:forEach items="${genres}" var="genre">
							<option value="${genre.key}">${genre.value}</option>
						</c:forEach>

				</select></td>


			</tr>


		</table>
		<br />
		<input type="submit" value="See Videos" />
	</form:form>
</body>
</html>
