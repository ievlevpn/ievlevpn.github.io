---
layout: default
title: Home
permalink: /
---

# Welcome

I am a Professor of Computer Science with research interests in artificial intelligence, machine learning, and computational methods. My work focuses on developing novel algorithms and applications that bridge theoretical foundations with practical implementations.

## Recent Highlights

{% if site.academic.show_publications_on_home %}
### Recent Publications

{% assign recent_publications = site.publications | sort: 'date' | reverse | limit: site.academic.publications_limit %}
{% if recent_publications.size > 0 %}
<div class="publication-list">
  {% for publication in recent_publications %}
  <div class="publication-item">
    <div class="title">
      <a href="{{ publication.url | relative_url }}">{{ publication.title }}</a>
    </div>
    {% if publication.authors %}
    <div class="authors">{{ publication.authors | join: ", " }}</div>
    {% endif %}
    {% if publication.venue %}
    <div class="venue">{{ publication.venue }} {% if publication.year %}({{ publication.year }}){% endif %}</div>
    {% endif %}
    {% if publication.doi or publication.arxiv or publication.pdf %}
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
    </div>
    {% endif %}
  </div>
  {% endfor %}
</div>

<p><a href="{{ "/publications/" | relative_url }}">View all publications →</a></p>
{% else %}
<p>No publications available yet.</p>
{% endif %}
{% endif %}

{% if site.academic.show_recent_talks %}
### Recent Talks

{% assign recent_talks = site.talks | sort: 'date' | reverse | limit: 3 %}
{% if recent_talks.size > 0 %}
<div class="publication-list">
  {% for talk in recent_talks %}
  <div class="publication-item">
    <div class="title">
      <a href="{{ talk.url | relative_url }}">{{ talk.title }}</a>
    </div>
    {% if talk.venue %}
    <div class="venue">{{ talk.venue }} {% if talk.date %}({{ talk.date | date: "%B %Y" }}){% endif %}</div>
    {% endif %}
    {% if talk.location %}
    <div class="venue">{{ talk.location }}</div>
    {% endif %}
  </div>
  {% endfor %}
</div>

<p><a href="{{ "/talks/" | relative_url }}">View all talks →</a></p>
{% else %}
<p>No talks available yet.</p>
{% endif %}
{% endif %}

## Research Interests

{% if site.academic.research_interests %}
{% for interest in site.academic.research_interests %}
- {{ interest }}
{% endfor %}
{% endif %}

## Contact

**Email:** {{ site.email }}

{% if site.orcid %}
**ORCID:** [{{ site.orcid }}](https://orcid.org/{{ site.orcid }})
{% endif %}

{% if site.scholar %}
**Google Scholar:** [Profile](https://scholar.google.com/citations?user={{ site.scholar }})
{% endif %}

---

*This website is built with Jekyll and managed through Obsidian for seamless content creation and academic workflow integration.*