---
layout: content
---
## This is a repository of collected Bing Wallpaper

<ul style="list-style: none;">
		{% assign images = site.static_files | where: "image", true %}
		{% for image in images %}
			{% unless image.name contains '.png' %}
			<li>
			<a href="assets/{{ image.name }}"><img src="http://home.ustc.edu.cn/~lwr1242/bw-thumbnails/{{ image.name }}"><br/>{{ image.name }}</a>
			</li>
			{% endunless %}
		{% endfor %}
</ul>
