# Dread Hunger Statistics Manager
My second educational project, this time on Django Rest Framework.

**Dread Hunger** is a great asymmetric survival online game but it lacks some statistics between sessions.
This project allowed me to input result of each match to create charts with different stats such as win/loss rate for
civilians, win/loss rate for thralls, total player score, max/min player score, favourite roles for each player and 
much more.

I used django admin for inputting data, postgresql database as a storage and javascript for visualizing and creating
tables. 
# Getting started
Follow these simple instructions to get a copy of a project for personal use and testing.
## Prerequisites
The project uses PostgreSQL so you want it to be installed and ready.
## Installing
Clone the repository, create a new virtual environment and install all dependencies from a requirements.txt file.
```
pip install -r requirements.txt
```
Link your database in ```dh_stats/settings.py```
# TODO
Hide all exposed data.