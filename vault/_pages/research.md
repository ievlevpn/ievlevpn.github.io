---
layout: default
title: Research
permalink: /research/
---

# Research

`todo`

## Current Research Areas

`todo`
## Active Projects

{% assign current_projects = site.projects | where: "status", "active" | sort: "start_date" | reverse %}
{% if current_projects.size > 0 %}
{% for project in current_projects %}
### {{ project.title }}

{% if project.description %}
{{ project.description }}
{% endif %}

{% if project.collaborators %}
**Collaborators:** {{ project.collaborators | join: ", " }}
{% endif %}

{% if project.funding %}
**Funding:** {{ project.funding }}
{% endif %}

{% if project.website or project.github %}
**Links:** 
{% if project.website %}[Project Website]({{ project.website }}){% endif %}
{% if project.github %}{% if project.website %} | {% endif %}[GitHub]({{ project.github }}){% endif %}
{% endif %}

---
{% endfor %}
{% else %}
*Project information will be displayed here as projects are added to the collection.*
{% endif %}

## Research Interests

{% if site.academic.research_interests %}
{% for interest in site.academic.research_interests %}
{% endfor %}
{% endif %}


### Selected Recent Work

{% assign featured_publications = site.publications | where: "featured", true | sort: "date" | reverse | limit: 3 %}
{% if featured_publications.size > 0 %}
{% for publication in featured_publications %}
- **[{{ publication.title }}]({{ publication.url | relative_url }})** ({{ publication.year }})  
  *{{ publication.venue }}*
{% endfor %}
{% else %}
{% assign recent_pubs = site.publications | sort: "date" | reverse | limit: 3 %}
{% for publication in recent_pubs %}
- **[{{ publication.title }}]({{ publication.url | relative_url }})** ({{ publication.year }})  
  *{{ publication.venue }}*
{% endfor %}
{% endif %}

[View all publications →]({{ "/publications/" | relative_url }})

## Contact for Research Collaboration

Interested in collaborating? I'm always open to discussing:
- Joint research projects
- Industry partnerships

**Email:** {{ site.email }}

---

*For the most up-to-date information, please don't hesitate to reach out directly.*