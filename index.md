---
layout: content
---
## This is a repository of collected Bing Wallpaper

<ul style="list-style: none;">
		{% assign images = site.static_files | where: "image", true %}
		{% tablerow image in images cols:2 %}
			{% unless image.name contains '.png' %}
			<a href="assets/{{ image.name }}"><img src="thumbnails/{{ image.name }}"></a>
			{% endunless %}
		{% endtablerow %}
</ul>
