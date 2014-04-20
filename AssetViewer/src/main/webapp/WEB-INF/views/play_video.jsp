<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Asset Viewer</title>
<link href="http://vjs.zencdn.net/4.5/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/4.5/video.js"></script>
<script src=resources/videojs.watermark.js></script>
<script src=resources/videojs.imageOverlay.js></script>
<script src=resources/ad.js></script>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link href="resources/videojs.watermark.css" rel="stylesheet">
<link href="resources/videojs.imageOverlay.css" rel="stylesheet">
</head>
<body>
	<h3>Asset Viewer</h3>
	<video id="player" class="video-js vjs-default-skin" controls
		preload="auto" width="640" height="264" poster="" data-setup="{}">
		<c:if test="${ext eq 'mp4' }">
			<source src="video/${videoName}" type='video/mp4' />
		</c:if>
		<c:if test="${ext eq 'flv' }">
			<source src="video/${videoName}" type='video/x-flv' />
		</c:if>

	</video>
	<script>
		// initialize video.js
		var player = videojs('player');
		var url = "resources/vast_inline_nonlinear.xml";

		// Set value to the plugin
		player.watermark({
			file : 'resources/thumbnail.jpg',
			//file: 'http://www.videojs.com/img/logo.png',
			xpos : 100,
			ypos : 0,
			xrepeat : 0,
			opacity : 0.4
		});

		getAndShowAds(player, url);
	</script>

</body>
</html>
