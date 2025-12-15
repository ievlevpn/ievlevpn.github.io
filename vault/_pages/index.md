---
layout: default
permalink: /
---

<div class="welcome-box" markdown="1">

# Hi!

I'm a probabilist interested in rare events and extreme values. I hold PhDs from Université de Lausanne and the Steklov Mathematical Institute in St. Petersburg.

{% if site.academic.research_interests %}
**Research interests:** {% for interest in site.academic.research_interests %}{{ interest }}{% unless forloop.last %}, {% endunless %}{% endfor %}.
{% endif %}

</div>

## Recent Highlights

{% assign all_highlights = "" | split: "" %}
{% for pub in site.publications %}
  {% assign all_highlights = all_highlights | push: pub %}
{% endfor %}
{% for talk in site.talks %}
  {% assign all_highlights = all_highlights | push: talk %}
{% endfor %}

{% assign sorted_highlights = all_highlights | sort: 'date' | reverse | slice: 0, 5 %}

{% if sorted_highlights.size > 0 %}
<div class="publication-list">
  {% for item in sorted_highlights %}
  <div class="publication-item">
    <div class="title">
      <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
      {% if item.collection == "publications" %}
      <span class="tag">publication</span>
      {% elsif item.collection == "talks" %}
      <span class="tag">talk</span>
      {% endif %}
    </div>
    {% if item.authors %}
    <div class="authors">{{ item.authors | join: ", " }}</div>
    {% endif %}
    {% if item.venue %}
    <div class="venue">{{ item.venue }}{% if item.year %} ({{ item.year }}){% endif %}</div>
    {% endif %}
    {% if item.location %}
    <div class="venue">{{ item.location }}</div>
    {% endif %}
  </div>
  {% endfor %}
</div>
{% else %}
<p>No highlights yet.</p>
{% endif %}
