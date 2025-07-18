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
    {% if publication.abstract %}
    <div class="abstract" style="margin-top: 0.5rem; font-size: 0.9em; color: var(--secondary-text);">
      {{ publication.abstract | truncatewords: 30 }}
    </div>
    {% endif %}
    {% if publication.doi or publication.arxiv or publication.pdf or publication.code or publication.website %}
    <div class="links">
      {% if publication.doi %}
      <a href="https://doi.org/{{ publication.doi }}" target="_blank" rel="noopener">DOI</a>
      {% endif %}
      {% if publication.arxiv %}
      <a href="https://arxiv.org/abs/{{ publication.arxiv }}" target="_blank" rel="noopener">arXiv</a>
      {% endif %}
      {% if publication.pdf %}
      <a href="{{ publication.pdf | relative_url }}" target="_blank">PDF</a>
      {% endif %}
      {% if publication.code %}
      <a href="{{ publication.code }}" target="_blank" rel="noopener">Code</a>
      {% endif %}
      {% if publication.website %}
      <a href="{{ publication.website }}" target="_blank" rel="noopener">Website</a>
      {% endif %}
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

---

## Publication Metrics

{% assign total_publications = site.publications | size %}
{% assign publications_with_doi = site.publications | where_exp: "pub", "pub.doi != nil" | size %}
{% assign publications_with_code = site.publications | where_exp: "pub", "pub.code != nil" | size %}

- **Total Publications:** {{ total_publications }}
- **Publications with DOI:** {{ publications_with_doi }}
- **Publications with Code:** {{ publications_with_code }}

{% if site.orcid %}
For a complete and up-to-date list, see my [ORCID profile](https://orcid.org/{{ site.orcid }}).
{% endif %}

{% if site.scholar %}
For citation metrics, see my [Google Scholar profile](https://scholar.google.com/citations?user={{ site.scholar }}).
{% endif %}