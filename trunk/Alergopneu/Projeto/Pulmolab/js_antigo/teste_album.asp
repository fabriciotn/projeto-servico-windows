<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="js/jquery-1.3.1.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="js/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" />
<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>




<script type="text/javascript">
	$(document).ready(function(){
		$("a[rel^='prettyOverlay'],a[rel^='prettyPhoto']").prettyPhoto({
			animationSpeed: 'normal', /* fast/slow/normal */
			padding: 40, /* padding for each side of the picture */
			opacity: 0.35, /* Value betwee 0 and 1 */
			showTitle: true, /* true/false */
			allowresize: true /* true/false */
			counter_separator_label: '/' /* The separator for the gallery counter 1 "of" 2 */
		});
	});
</script>

</head>

<body>
<a href="http://www.no-margin-for-errors.com/projects/prettyPhoto/images/thumbnails/t_5.jpg" rel="prettyPhoto" title="Description">
<img src="http://www.no-margin-for-errors.com/projects/prettyPhoto/images/thumbnails/t_5.jpg" alt="Picture 1 title" />
</a>
			
</body>
</html>
