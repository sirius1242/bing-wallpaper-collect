## This is a repository of collected Bing Wallpaper

{% assign images = site.static_files | where: "image", true %}
<ul>
    {% for image in images %}
    <li>
    <a href="{{ image.url }}"><img src="{{ image.url }}"><br/>{{ image.title }}</a>
    {% endfor %}
</ul>