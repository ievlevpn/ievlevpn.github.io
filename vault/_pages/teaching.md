---
layout: default
title: Teaching
permalink: /teaching/
---

# Teaching

I am passionate about education and committed to fostering the next generation of computer scientists and researchers. My teaching philosophy centers on combining rigorous theoretical foundations with hands-on practical experience.

## Current Courses

{% assign current_courses = site.teaching | where_exp: "course", "course.year >= 2024" | sort: "semester" %}
{% if current_courses.size > 0 %}
{% for course in current_courses %}
### {{ course.title }} ({{ course.course_code }})
*{{ course.semester }} {{ course.year }} • {{ course.level }} Level*

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

## Past Courses

{% assign past_courses = site.teaching | where_exp: "course", "course.year < 2024" | sort: "year" | reverse %}
{% if past_courses.size > 0 %}
<div class="cv-section">
  {% for course in past_courses %}
  <div class="cv-item">
    <div class="dates">
      {{ course.semester }} {{ course.year }}
    </div>
    <div class="details">
      <div class="position">{{ course.title }} ({{ course.course_code }})</div>
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

## Student Mentorship

### Graduate Students
I currently supervise **8 Ph.D. students** and **15 Master's students** across various research areas:

- **Ph.D. Students**: Working on cutting-edge research in AI/ML optimization, sustainable computing, and theoretical machine learning
- **Master's Students**: Thesis projects spanning industry applications and research foundations
- **Undergraduate Researchers**: Independent study projects and research experiences

### Mentorship Philosophy
- **Individual Growth**: Tailoring guidance to each student's interests and career goals
- **Research Skills**: Teaching literature review, experimental design, and scientific writing
- **Professional Development**: Preparing students for academic and industry careers
- **Work-Life Balance**: Supporting overall well-being and sustainable research practices

## Teaching Innovation

### Curriculum Development
- **New Course Design**: Developed advanced machine learning curriculum adopted university-wide
- **Interdisciplinary Integration**: Created cross-departmental programs connecting CS with other fields
- **Industry Alignment**: Regular curriculum updates based on industry feedback and job market trends

### Technology Integration
- **Interactive Tools**: Using Jupyter notebooks, online coding platforms, and visualization tools
- **Automated Assessment**: Implementing auto-grading systems for programming assignments
- **Remote Learning**: Developed hybrid and online course delivery methods

## Student Feedback

Recent course evaluations highlight:
- **Clarity of Instruction**: Consistently rated 4.8/5.0 for clear explanation of complex concepts
- **Practical Relevance**: Students appreciate the connection between theory and real-world applications
- **Supportive Environment**: High marks for accessibility and willingness to help students succeed

### Student Testimonials

> *"Professor's approach to teaching made machine learning accessible and exciting. The hands-on projects were challenging but incredibly rewarding."* - Graduate Student, CS 229

> *"The course structure perfectly balanced theoretical depth with practical implementation. I feel well-prepared for my industry role."* - Undergraduate Student, CS 181

## Academic Service

### Curriculum Committees
- **Graduate Admissions Committee**: Reviewing applications and shaping admission criteria
- **Curriculum Development**: Leading efforts to modernize computer science education
- **Faculty Search**: Participating in hiring processes for new teaching faculty

### External Review
- **Program Evaluation**: Serving as external reviewer for computer science programs
- **Accreditation**: Contributing to ABET accreditation processes
- **Editorial Boards**: Reviewing educational content for academic publications

## Teaching Resources

### Open Educational Materials
I believe in making high-quality education accessible to all:
- **Lecture Notes**: Publicly available course materials and presentations
- **Code Repositories**: Open-source implementations of algorithms and projects
- **Video Lectures**: Selected lectures available online for broader access

### Professional Development
- **Teaching Workshops**: Regular participation in pedagogical training
- **Conference Presentations**: Sharing teaching innovations at academic conferences
- **Peer Collaboration**: Working with colleagues to improve teaching methods

---

## Get Involved

### For Current Students
- **Office Hours**: Tuesdays and Thursdays, 2-4 PM, or by appointment
- **Research Opportunities**: Multiple openings for undergraduate and graduate research
- **Independent Study**: Tailored projects for motivated students

### For Prospective Students
- **Course Prerequisites**: Check individual course pages for requirements
- **Research Interests**: Contact me if you're interested in AI/ML research
- **Application Guidance**: Happy to discuss graduate school and career paths

**Contact:** {{ site.email }}