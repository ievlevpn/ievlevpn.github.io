---
layout: talk
title: "<% tp.file.title %>"
date: <% tp.date.now("YYYY-MM-DD") %>
venue: "Conference/Event Name"
location: "City, State/Country"
type: "invited" # invited, contributed, keynote, workshop, seminar
duration: "45 minutes"
audience_size: ""
slides: "/assets/slides/talk-title.pdf"
video: ""
abstract: |
  Brief description of the talk content and key messages.
topics:
  - "Topic 1"
  - "Topic 2"
  - "Topic 3"
---

# <% tp.file.title %>

## Abstract

Detailed description of the talk content, key points covered, and target audience.

## Key Points

- Main point 1
- Main point 2
- Main point 3

## Materials

- [Slides]({{ page.slides }})
{% if page.video %}- [Video Recording]({{ page.video }}){% endif %}

## Feedback

Summary of audience reception and questions received.