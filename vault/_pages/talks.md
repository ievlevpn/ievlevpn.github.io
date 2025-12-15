---
layout: default
title: Talks
permalink: /talks/
---

# Talks

{% assign talks_by_year = site.talks | group_by: 'year' | sort: 'name' | reverse %}

{% if talks_by_year.size > 0 %}
{% for year_group in talks_by_year %}
## {{ year_group.name }}

<div class="publication-list">
  {% assign year_talks = year_group.items | sort: 'date' | reverse %}
  {% for talk in year_talks %}
  <div class="publication-item">
    <div class="title">
      <a href="{{ talk.url | relative_url }}">{{ talk.title }}</a>
      {% if talk.type %}<span class="tag">{{ talk.type }}</span>{% endif %}
    </div>
    <div class="venue">{{ talk.venue }}</div>
    {% if talk.location %}
    <div class="venue">{{ talk.location }}</div>
    {% endif %}
    {% if talk.slides or talk.video %}
    <div class="links">
      {% if talk.slides %}
      <a href="{{ talk.slides | relative_url }}" target="_blank" class="link-badge link-slides">slides</a>
      {% endif %}
      {% if talk.video %}
      <a href="{{ talk.video }}" target="_blank" class="link-badge link-video">video</a>
      {% endif %}
    </div>
    {% endif %}
  </div>
  {% endfor %}
</div>
{% endfor %}
{% else %}
<p>No talks available yet.</p>
{% endif %}
