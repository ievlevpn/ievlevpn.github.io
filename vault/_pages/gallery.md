---
layout: default
title: Gallery
permalink: /gallery/
---

# Gallery

Interactive illustrations of some mathematical objects I'm interested in, built with [three.js](https://threejs.org/).

<style>
  .gallery-thumb {
    display: block; width: 100%; height: 240px; overflow: hidden;
    border-radius: 6px; border: 1px solid var(--hairline, #ddd); background: #f1efe8;
  }
  .gallery-thumb img { width: 100%; height: 100%; object-fit: cover; display: block; }
</style>

<div class="publication-list">
  {% for item in site.data.gallery %}
  <div class="publication-item">
    {% assign src = '/viz/' | append: item.file | relative_url %}
    {% assign poster = item.file | replace: '.html', '.png' | prepend: '/viz/' | relative_url %}
    <a class="gallery-thumb" href="{{ src }}"><img src="{{ poster }}" alt="{{ item.title }}" loading="lazy"></a>
    <div class="title" style="margin-top:.6em">
      <a href="{{ src }}">{{ item.title }}</a>
    </div>
    {% if item.description %}<div class="venue">{{ item.description }}</div>{% endif %}
  </div>
  {% endfor %}
</div>
