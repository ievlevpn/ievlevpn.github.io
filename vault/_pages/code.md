---
layout: default
title: Code
permalink: /code/
---

# Code

{% assign sections = "project,Projects|tool,Tools" | split: "|" %}
{% for section in sections %}
{% assign parts = section | split: "," %}
{% assign cat = parts[0] %}
{% assign items = site.code | where: "category", cat | sort: "date" | reverse %}
{% if items.size > 0 %}
## {{ parts[1] }}

<div class="publication-list">
  {% for item in items %}
  <div class="publication-item">
    <div class="title">
      <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
    </div>
    {% if item.description %}<div class="venue">{{ item.description }}</div>{% endif %}
    {% if item.github %}
    <div class="links">
      <a href="{{ item.github }}" target="_blank" class="link-badge link-code">GitHub</a>
    </div>
    {% endif %}
  </div>
  {% endfor %}
</div>
{% endif %}
{% endfor %}
