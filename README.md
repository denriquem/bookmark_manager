## User Story
```
As a user,
So I can save important webpages,
I would like to see a list of bookmarks.
```
![class diagram](./images/class_diagram.png)

## Setup

Setting up the SQL database

a > psql postgres
a > CREATE DATABASE bookmark_manager;
a > \c bookmark_manager
a > CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
