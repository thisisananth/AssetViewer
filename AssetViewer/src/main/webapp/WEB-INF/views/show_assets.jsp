<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Asset Viewer</title>
</head>
<body>
	<h1>Asset Viewer - List of files</h1>
	
		<table style="table-layout:fixed" id="enrichTable">
			<tr>
				<th><label>Video Name:</label></th>
				<th><label>File Name:</label></th>
				<th><label>Thumbnail Name:</label></th>
				<th><label>Genre:</label></th>
				<th><label>Category:</label></th>
				
			</tr>
			<c:forEach varStatus="counter" var="video" items="${assets.videos}">

				<tr>
					<td style="word-wrap:break-word" >${video.videoName }</td>
					<td style="word-wrap:break-word" >${video.videoFileName }</td>
					<td style="word-wrap:break-word" ><a href="play?v=${video.videoFileName}" ><img width="50"  alt="thumbnail not available" src="images/${video.thumbFileName }"></a></td>
					<td style="word-wrap:break-word" >${video.genreName }</td>
					<td style="word-wrap:break-word" >${video.categoryName }</td>
					

				</tr>

			</c:forEach>
		</table>
	<br/>
	
</body>