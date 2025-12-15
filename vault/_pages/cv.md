---
layout: default
title: Curriculum Vitae
permalink: /cv/
---

<div style="display: flex; justify-content: space-between; align-items: baseline;">
<h1 style="margin: 0;">Curriculum Vitae</h1>
{% if site.academic.cv_pdf_path %}<a href="{{ site.academic.cv_pdf_path | relative_url }}">Download PDF</a>{% endif %}
</div>

## Education

{% assign education_sorted = site.education | sort: 'graduation_year' | reverse %}
{% if education_sorted.size > 0 %}
<div class="cv-section">
  {% for degree in education_sorted %}
  <div class="cv-item">
    <div class="dates">
      {% if degree.graduation_year %}{{ degree.graduation_year }}{% endif %}
    </div>
    <div class="details">
      <div class="position">{{ degree.degree }} in {{ degree.field }}</div>
      <div class="institution">{{ degree.institution }}</div>
      {% if degree.thesis_title %}
      <div class="description">
        <strong>Thesis:</strong> {{ degree.thesis_title }}{% if degree.thesis_language %} (in {{ degree.thesis_language }}){% endif %}
        {% if degree.thesis_pdf %} <a href="{{ degree.thesis_pdf | relative_url }}" class="link-badge link-pdf">pdf</a>{% endif %}
        {% if degree.advisor %}<br><strong>Advisor:</strong> {{ degree.advisor }}{% endif %}
      </div>
      {% endif %}
      {% if degree.gpa %}
      <div class="description"><strong>GPA:</strong> {{ degree.gpa }}</div>
      {% endif %}
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
<p><em>Education information will be displayed here. Add entries to the <code>vault/_education/</code> directory.</em></p>
{% endif %}

{% assign recent_publications = site.publications | sort: 'date' | reverse | limit: 10 %}
{% if recent_publications.size > 0 %}
## Publications

<div class="cv-section">
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
    </div>
    {% endfor %}
  </div>
  <p><a href="{{ "/publications/" | relative_url }}">View all publications →</a></p>
</div>
{% else %}
<p><em>Publications will be displayed here. Add entries to the <code>vault/_publications/</code> directory.</em></p>
{% endif %}

## Teaching

{% assign teaching_sorted = site.teaching | sort: 'year' | reverse %}
{% if teaching_sorted.size > 0 %}
<div class="cv-section">
  {% for course in teaching_sorted %}
  <div class="cv-item">
    <div class="dates">
      {{ course.semester }} {% if course.years %} {{ course.years }} {% else %} {{ course.year }} {% endif %}
    </div>
    <div class="details">
      <div class="position">{{ course.title }}</div>
      <div class="institution">{{ course.institution }}</div>
      {% if course.role %}
      <div class="description"><strong>Role:</strong> {{ course.role }}</div>
      {% endif %}
      {% if course.enrollment %}
      <div class="description"><strong>Enrollment:</strong> {{ course.enrollment }} students</div>
      {% endif %}
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
<p><em>Teaching information will be displayed here. Add entries to the <code>vault/_teaching/</code> directory.</em></p>
{% endif %}

## Selected Talks & Presentations

{% assign talks_sorted = site.talks | sort: 'date' | reverse | slice: 0, 8 %}
{% if talks_sorted.size > 0 %}
<div class="cv-section">
  {% for talk in talks_sorted %}
  <div class="cv-item">
    <div class="dates">
      {% if talk.date %}{{ talk.date | date: "%Y" }}{% endif %}
    </div>
    <div class="details">
      <div class="position">{{ talk.title }}</div>
      <div class="institution">{{ talk.venue }}</div>
      {% if talk.location %}
      <div class="institution">{{ talk.location }}</div>
      {% endif %}
      {% if talk.type %}
      <div class="description"><strong>Type:</strong> {{ talk.type }}</div>
      {% endif %}
    </div>
  </div>
  {% endfor %}
</div>
<p><a href="{{ "/talks/" | relative_url }}">View all talks →</a></p>
{% else %}
<p><em>Talks information will be displayed here. Add entries to the <code>vault/_talks/</code> directory.</em></p>
{% endif %}

