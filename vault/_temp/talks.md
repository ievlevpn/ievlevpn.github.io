---
layout: default
title: Talks & Presentations
permalink: /talks/
---

# Talks & Presentations

I regularly present my research at conferences, workshops, and invited seminars. Below is a comprehensive list of my presentations, organized by year and type.

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

## Recent Presentations (2024)

{% assign recent_talks = site.talks | where_exp: "talk", "talk.date <= site.time" | where: "year", 2024 | sort: "date" | reverse %}
{% if recent_talks.size > 0 %}
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

### Keynote Addresses
{% assign keynote_talks = site.talks | where: "type", "keynote" | sort: "date" | reverse %}
{% if keynote_talks.size > 0 %}
{% for talk in keynote_talks %}
- **{{ talk.title }}** - *{{ talk.venue }}* ({{ talk.date | date: "%Y" }})
{% endfor %}
{% else %}
*Keynote presentations will be listed here.*
{% endif %}

### Invited Seminars
{% assign invited_talks = site.talks | where: "type", "invited" | sort: "date" | reverse | limit: 5 %}
{% if invited_talks.size > 0 %}
{% for talk in invited_talks %}
- **{{ talk.title }}** - *{{ talk.venue }}* ({{ talk.date | date: "%Y" }})
{% endfor %}
{% if site.talks.size > 5 %}
[View all invited talks →](#all-talks)
{% endif %}
{% else %}
*Invited seminars will be listed here.*
{% endif %}

### Conference Presentations
{% assign conference_talks = site.talks | where: "type", "contributed" | sort: "date" | reverse | limit: 5 %}
{% if conference_talks.size > 0 %}
{% for talk in conference_talks %}
- **{{ talk.title }}** - *{{ talk.venue }}* ({{ talk.date | date: "%Y" }})
{% endfor %}
{% if site.talks.size > 5 %}
[View all conference talks →](#all-talks)
{% endif %}
{% else %}
*Conference presentations will be listed here.*
{% endif %}

## Speaking Topics

I frequently speak on the following research areas:

### Artificial Intelligence & Machine Learning
- **Neural Network Optimization**: Efficient training methods for large-scale models
- **Sustainable AI**: Environmental considerations in machine learning
- **Theoretical Foundations**: Mathematical underpinnings of learning algorithms

### Industry Applications
- **Practical AI Deployment**: Real-world implementation challenges and solutions
- **Ethics in AI**: Responsible development and deployment of AI systems
- **Future of AI**: Trends and predictions for the field

### Academic & Career Development
- **Research Methodology**: Best practices for conducting AI/ML research
- **Academic Career Paths**: Guidance for graduate students and postdocs
- **Industry Transitions**: Moving between academic and industry roles

## Speaking Engagement Information

### Availability
I am available for speaking engagements including:
- Conference keynotes and invited talks
- University seminars and colloquia
- Industry workshops and training sessions
- Panel discussions and fireside chats
- Podcast interviews and media appearances

### Topics of Expertise
- Machine Learning and Deep Learning
- AI Ethics and Responsible Computing
- Research Methodology and Career Development
- Academic-Industry Collaboration
- Sustainable Computing and Green AI

### Technical Requirements
- **Remote Presentations**: Fully equipped for high-quality virtual presentations
- **Travel**: Available for domestic and international speaking engagements
- **Materials**: Can provide slides, handouts, and follow-up materials
- **Format Flexibility**: Adaptable to various presentation formats and durations

## Past Speaking Engagements by Year

<div id="all-talks"></div>

{% assign talks_by_year = site.talks | group_by: 'year' | sort: 'name' | reverse %}
{% for year_group in talks_by_year %}
{% if year_group.name != "2024" %}
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
- **Keynote Addresses:** {{ keynote_count }}
- **Invited Seminars:** {{ invited_count }}
- **Conference Talks:** {{ conference_count }}

## Contact for Speaking Engagements

Interested in having me speak at your event? I'd be happy to discuss:

- **Academic Conferences**: Research presentations and keynote addresses
- **Industry Events**: Workshops, training sessions, and corporate seminars
- **Educational Institutions**: Guest lectures and student seminars
- **Media Appearances**: Interviews, panels, and expert commentary

**Contact:** {{ site.email }}

**Speaking Topics Available:** AI/ML research, sustainable computing, academic career development, industry trends

---

*For the most current information about upcoming talks and availability, please contact me directly.*