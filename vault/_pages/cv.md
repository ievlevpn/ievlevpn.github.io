---
layout: default
title: Curriculum Vitae
permalink: /cv/
---

# Curriculum Vitae

{% if site.academic.cv_pdf_path %}
<p style="text-align: center; margin-bottom: 2rem;">
  <a href="{{ site.academic.cv_pdf_path | relative_url }}" target="_blank" class="cv-download-link" style="background-color: var(--accent-color); color: white; padding: 0.75rem 1.5rem; border-radius: 6px; text-decoration: none; font-weight: 500;">
    Download PDF Version
  </a>
</p>
{% endif %}

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
        <strong>Thesis:</strong> {{ degree.thesis_title }}
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

## Professional Experience

{% assign experience_sorted = site.experience | sort: 'start_date' | reverse %}
{% if experience_sorted.size > 0 %}
<div class="cv-section">
  {% for position in experience_sorted %}
  <div class="cv-item">
    <div class="dates">
      {{ position.start_date | date: "%Y" }}–{% if position.end_date %}{{ position.end_date | date: "%Y" }}{% else %}Present{% endif %}
    </div>
    <div class="details">
      <div class="position">{{ position.title }}</div>
      <div class="institution">{{ position.organization }}</div>
      {% if position.location %}
      <div class="institution">{{ position.location }}</div>
      {% endif %}
      {% if position.description %}
      <div class="description">{{ position.description | markdownify }}</div>
      {% endif %}
    </div>
  </div>
  {% endfor %}
</div>
{% else %}
<p><em>Experience information will be displayed here. Add entries to the <code>vault/_experience/</code> directory.</em></p>
{% endif %}

## Publications

{% assign recent_publications = site.publications | sort: 'date' | reverse | limit: 10 %}
{% if recent_publications.size > 0 %}
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

{% assign teaching_sorted = site.teaching | sort: 'semester' | reverse %}
{% if teaching_sorted.size > 0 %}
<div class="cv-section">
  {% for course in teaching_sorted %}
  <div class="cv-item">
    <div class="dates">
      {{ course.semester }} {{ course.year }}
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

{% assign talks_sorted = site.talks | sort: 'date' | reverse | limit: 8 %}
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

---

<div style="text-align: center; font-size: 0.9em; color: var(--secondary-text); margin-top: 3rem;">
  <p>Last updated: {{ 'now' | date: "%B %Y" }}</p>
  {% if site.academic.cv_pdf_path %}
  <p><a href="{{ site.academic.cv_pdf_path | relative_url }}" target="_blank">Download complete CV as PDF</a></p>
  {% endif %}
</div>