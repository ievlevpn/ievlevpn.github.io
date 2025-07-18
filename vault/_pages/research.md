---
layout: default
title: Research
permalink: /research/
---

# Research

My research focuses on developing novel algorithms and computational methods that advance the state of artificial intelligence and machine learning. I am particularly interested in the intersection of theoretical foundations and practical applications.

## Current Research Areas

### Neural Network Optimization
Developing efficient training algorithms for large-scale neural networks, with emphasis on:
- Adaptive learning rate scheduling
- Gradient compression techniques
- Distributed training optimization
- Memory-efficient architectures

### Sustainable AI
Investigating methods to reduce the environmental impact of machine learning:
- Energy-efficient model architectures
- Carbon-aware training strategies
- Model compression and pruning
- Green computing for AI workloads

### Theoretical Machine Learning
Advancing our understanding of learning algorithms through:
- Generalization bounds and learning theory
- Optimization landscape analysis
- Convergence guarantees for adaptive methods
- Statistical learning foundations

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
- **{{ interest }}**: Investigating novel approaches and applications
{% endfor %}
{% endif %}

## Research Impact

### Publications Metrics
{% assign total_publications = site.publications | size %}
{% assign recent_publications = site.publications | where_exp: "pub", "pub.year >= 2020" | size %}
- **Total Publications:** {{ total_publications }}
- **Recent Publications (2020+):** {{ recent_publications }}

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

## Collaborations

I actively collaborate with researchers across academia and industry, including:
- Faculty at leading research universities
- Research scientists at major technology companies
- International research institutions
- Interdisciplinary teams spanning computer science, mathematics, and domain applications

## Funding

Research activities are supported by grants from:
- National Science Foundation (NSF)
- National Institutes of Health (NIH)
- Industry partnerships
- University research funds

## Contact for Research Collaboration

Interested in collaborating? I'm always open to discussing:
- Joint research projects
- Student exchanges and visits
- Grant proposals and funding opportunities
- Industry partnerships

**Email:** {{ site.email }}

---

*For the most up-to-date information about ongoing research projects and opportunities, please don't hesitate to reach out directly.*