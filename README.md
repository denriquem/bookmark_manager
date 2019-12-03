## User Story

```
As a user,
So I can save important webpages,
I would like to see a list of bookmarks.
```
![class diagram](./images/class_diagram.png)

## Setup

Setting up the SQL database

```
> psql postgres
> CREATE DATABASE bookmark_manager;
> \c bookmark_manager
> CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```

Setting up the test SQL database
```
> createdb bookmark_manager_test
> psql bookmark_manager_test
> CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```
