---
layout: default
title: Teaching
permalink: /teaching/
---
{% assign current_year = "now" | date: "%Y" | plus: 0 %}
# Teaching

{% assign current_courses = site.teaching | where_exp: "course", "course.year >= current_year" | sort: "semester" %}
{% if current_courses.size > 0 %}
## Current Courses

{% for course in current_courses %}
### {{ course.title }} {% if course.course_code %} ({{ course.course_code }}) {% endif %}
{% if course.years %}
*{{ course.semester }} {{ course.years }} • {{ course.level }} Level*
{% else %}
*{{ course.semester }} {{ course.year }} • {{ course.level }} Level*
{% endif %}

{{ course.description }}

{% if course.enrollment %}**Enrollment:** {{ course.enrollment }} students{% endif %}
{% if course.syllabus %}**[Syllabus]({{ course.syllabus }})**{% endif %}
{% if course.website %}**[Course Website]({{ course.website }})**{% endif %}

**Topics Covered:**
{% for topic in course.topics %}
- {{ topic }}
{% endfor %}

---
{% endfor %}
{% else %}
*Current course information will be displayed here.*
{% endif %}

{% if teaching-philosophy %}
## Teaching Philosophy

My approach to teaching is built on several core principles:

### Active Learning
- **Hands-on Projects**: Students implement algorithms and build systems from scratch
- **Interactive Discussions**: Encouraging questions and collaborative problem-solving
- **Real-world Applications**: Connecting theory to current industry practices

### Inclusive Environment
- **Diverse Perspectives**: Welcoming students from all backgrounds and experience levels
- **Multiple Learning Styles**: Combining lectures, visual aids, coding exercises, and group work
- **Supportive Community**: Fostering peer learning and collaboration

### Current Relevance
- **Industry Connections**: Bringing in guest speakers and industry case studies
- **Cutting-edge Research**: Incorporating recent developments and ongoing research
- **Practical Skills**: Teaching tools and methodologies used in professional settings

{% endif %}

{% assign past_courses = site.teaching | where_exp: "course", "course.year < current_year" | sort: "year" | reverse %}
{% if past_courses.size > 0 %}
## Past Courses

<div class="cv-section">
  {% for course in past_courses %}
  <div class="cv-item">
    <div class="dates">
      {{ course.semester }} {{ course.years }}
    </div>
    <div class="details">
      <div class="position">{{ course.title }} {% if course.course_code %} ({{ course.course_code }}) {% endif %}</div>
      <div class="institution">{{ course.institution }}</div>
      {% if course.role and course.role != "Instructor" %}
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
*Teaching history will be displayed here as courses are added.*
{% endif %}