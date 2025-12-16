---
layout: default
title: Teaching
permalink: /teaching/
---

# Teaching

{% assign current_courses = site.teaching | where: "current", true | sort: "year" | reverse %}
{% if current_courses.size > 0 %}
## Current Courses

<div class="cv-section">
{% for course in current_courses %}
<div class="cv-item">
  <div class="dates">{{ course.semester }} {{ course.year }}</div>
  <div class="details">
    <div class="position"><a href="{{ course.url | relative_url }}">{{ course.title }}</a></div>
    <div class="institution">{{ course.institution }} · {{ course.role }} · {{ course.level }}</div>
    {% if course.description %}<div class="description">{{ course.description }}</div>{% endif %}
    {% if course.materials %}<div class="description"><a href="{{ course.url | relative_url }}">Lecture notes available</a></div>{% endif %}
  </div>
</div>
{% endfor %}
</div>
{% endif %}

{% assign past_courses = site.teaching | where_exp: "course", "course.current != true or course.years" | sort: "year" | reverse %}
{% if past_courses.size > 0 %}
## Past Courses

<div class="cv-section">
{% for course in past_courses %}
<div class="cv-item">
  <div class="dates">{% if course.years %}{{ course.years }}{% else %}{{ course.year }}{% endif %}</div>
  <div class="details">
    <div class="position"><a href="{{ course.url | relative_url }}">{{ course.title }}</a></div>
    <div class="institution">{{ course.institution }}{% if course.role and course.role != "Lecturer" %} · {{ course.role }}{% endif %}</div>
    {% if course.materials %}<div class="description"><a href="{{ course.url | relative_url }}">Lecture notes available</a></div>{% endif %}
  </div>
</div>
{% endfor %}
</div>
{% endif %}
