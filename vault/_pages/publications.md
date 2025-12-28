---
layout: default
title: Publications
permalink: /publications/
---

# Publications

{% assign publications_by_year = site.publications | group_by: 'year' | sort: 'name' | reverse %}

{% if publications_by_year.size > 0 %}
{% for year_group in publications_by_year %}
## {{ year_group.name | default: "Upcoming" }}

<div class="publication-list">
  {% assign sorted_publications = year_group.items | sort: 'date' | reverse %}
  {% for publication in sorted_publications %}
  <div class="publication-item">
    <div class="title">
      <a href="{{ publication.url | relative_url }}">{{ publication.title }}</a>
    </div>
    {% if publication.authors %}
    <div class="authors">{{ publication.authors | join: ", " }}</div>
    {% endif %}
    {% if publication.venue %}
    <div class="venue">{{ publication.venue }}</div>
    {% endif %}
    {% if publication.description or publication.abstract %}
    <div class="abstract" style="margin-top: 0.5rem; font-size: 0.9em; color: var(--text-light);">
      {{ publication.description | default: publication.abstract | truncatewords: 30 }}
    </div>
    {% endif %}
    {% if publication.doi or publication.arxiv or publication.pdf or publication.code or publication.website %}
    <div class="links">
      {% include publication-links.html pub=publication %}
    </div>
    {% endif %}
  </div>
  {% endfor %}
</div>
{% endfor %}
{% else %}
<p>No publications available yet. Publications will be displayed here as they are added to the collection.</p>

<p><em>To add publications, create markdown files in the <code>vault/_publications/</code> directory with appropriate front matter.</em></p>
{% endif %}

