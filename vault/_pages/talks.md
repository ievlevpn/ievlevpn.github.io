---
layout: default
title: Talks & Presentations
permalink: /talks/
---
{% assign current_year = "now" | date: "%Y" | plus: 0 %}
# Talks & Presentations

Below is a comprehensive list of my presentations, organized by year and type.

## Upcoming Talks

{% assign upcoming_talks = site.talks | where_exp: "talk", "talk.date > site.time" | sort: "date" %}
{% if upcoming_talks.size > 0 %}
{% for talk in upcoming_talks %}
### {{ talk.title }}
**{{ talk.venue }}** | {{ talk.location }} | {{ talk.date | date: "%B %d, %Y" }}
*{{ talk.type | capitalize }} Talk*

{% if talk.abstract %}
{{ talk.abstract }}
{% endif %}

{% if talk.registration_url %}
**[Registration Required]({{ talk.registration_url }})**
{% endif %}

---
{% endfor %}
{% else %}
*No upcoming talks scheduled. Check back for updates.*
{% endif %}

{% assign recent_talks = site.talks | where_exp: "talk", "talk.date <= site.time" | where: "year", {{ current_year }} | sort: "date" | reverse %}
{% if recent_talks.size > 0 %}
## Recent Presentations ({{ current_year }})

{% for talk in recent_talks %}
### {{ talk.title }}
**{{ talk.venue }}** | {{ talk.location }} | {{ talk.date | date: "%B %d, %Y" }}
*{{ talk.type | capitalize }} Talk{% if talk.duration %} ({{ talk.duration }}){% endif %}*

{% if talk.abstract %}
{{ talk.abstract | truncatewords: 30 }}
{% endif %}

{% if talk.slides or talk.video %}
**Materials:** 
{% if talk.slides %}[Slides]({{ talk.slides }}){% endif %}
{% if talk.video %}{% if talk.slides %} | {% endif %}[Video]({{ talk.video }}){% endif %}
{% endif %}

{% if talk.audience_size %}
*Audience: {{ talk.audience_size }} attendees*
{% endif %}

---
{% endfor %}
{% else %}
*Recent talks will be displayed here.*
{% endif %}

## Talk Categories

{% assign keynote_talks = site.talks | where: "type", "keynote" | sort: "date" | reverse %}
{% if keynote_talks.size > 0 %}
### Keynote Addresses
{% for talk in keynote_talks %}
- **{{ talk.title }}** - *{{ talk.venue }}* ({{ talk.date | date: "%Y" }})
{% endfor %}
{% endif %}

{% assign invited_talks = site.talks | where: "type", "invited" | sort: "date" | reverse | limit: 5 %}
{% if invited_talks.size > 0 %}
### Invited Seminars
{% for talk in invited_talks %}
- **{{ talk.title }}** - *{{ talk.venue }}* ({{ talk.date | date: "%Y" }})
{% endfor %}
{% if site.talks.size > 5 %}
[View all invited talks →](#all-talks)
{% endif %}
{% endif %}

{% assign conference_talks = site.talks | where: "type", "contributed" | sort: "date" | reverse | limit: 5 %}
{% if conference_talks.size > 0 %}
### Conference Presentations
{% for talk in conference_talks %}
- **{{ talk.title }}** - *{{ talk.venue }}* ({{ talk.date | date: "%Y" }})
{% endfor %}
{% if site.talks.size > 5 %}
[View all conference talks →](#all-talks)
{% endif %}
{% endif %}

## Past Speaking Engagements by Year

<div id="all-talks"></div>

{% assign talks_by_year = site.talks | group_by: 'year' | sort: 'name' | reverse %}
{% for year_group in talks_by_year %}
{% if year_group.name < {{ current_year }} %}

### {{ year_group.name }}

<div class="publication-list">
  {% assign year_talks = year_group.items | sort: 'date' | reverse %}
  {% for talk in year_talks %}
  <div class="publication-item">
    <div class="title">
      <a href="{{ talk.url | relative_url }}">{{ talk.title }}</a>
    </div>
    <div class="venue">{{ talk.venue }} | {{ talk.location }}</div>
    <div class="venue">{{ talk.type | capitalize }} Talk | {{ talk.date | date: "%B %d, %Y" }}</div>
    {% if talk.slides or talk.video %}
    <div class="links">
      {% if talk.slides %}
      <a href="{{ talk.slides }}" target="_blank">Slides</a>
      {% endif %}
      {% if talk.video %}
      <a href="{{ talk.video }}" target="_blank">Video</a>
      {% endif %}
    </div>
    {% endif %}
  </div>
  {% endfor %}
</div>
{% endif %}
{% endfor %}

## Speaking Statistics

{% assign total_talks = site.talks | size %}
{% assign keynote_count = site.talks | where: "type", "keynote" | size %}
{% assign invited_count = site.talks | where: "type", "invited" | size %}
{% assign conference_count = site.talks | where: "type", "contributed" | size %}

- **Total Presentations:** {{ total_talks }}
{% if keynote_count > 0 %}
- **Keynote Addresses:** {{ keynote_count }} 
{% endif %}
- **Invited Seminars:** {{ invited_count }}
- **Conference Talks:** {{ conference_count }}

---

