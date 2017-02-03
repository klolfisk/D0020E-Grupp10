D0020E, Autumn of '16
============================
Project in computer science, Group 10

This is a project for the course D0020E at Luleå University of Technology.
The goal of the project is to make a web-based GUI for administering Docker containers.

The system should:
* Allow for administration of a docker session from a web interface.
* Be secure.
* TODO

We have chosen to not focus on the following features:
* Good looks.
* TODO
* TODO

Get started
-----------

1. Install Docker
2. Install Ruby on Rails
3. Enable Dockers remote API (like [this](https://www.ivankrizsan.se/2016/05/18/enabling-docker-remote-api-on-ubuntu-16-04/))
4. Clone this repository into Rails. The current working branch is `gui-skeleton`
5. Run `bundle install`.
6. Change the `Docker.url` line in the container controller of rails, to use the IP for your docker remote API. If you are running Docker on the same machine as rails, this will be `Docker.url = 'tcp://localhost:4243'`.

Infrastructure
--------------

The following tools, frameworks, projects and libraries are (might be) used in this project:

* Repository
  - Github
* ~~Webserver~~
  - ~~Nginx~~
* ~~Database~~
  - ~~MongoDB~~
* CSS
  - Bootstrap
* ~~Javascript~~
  - ~~Angular.js~~

Reading material
----------------

Get github Student developer pack
* [Student developer pack](https://education.github.com/pack)

Agile workflow in git:
* [GitHub Issues Can be Agile if You Do it Right](https://zube.io/blog/agile-project-management-workflow-for-github-issues/)
* [waffle.io](https://waffle.io/)
* [How GitHub uses GitHub to build GitHub](https://www.youtube.com/watch?v=qyz3jkOBbQY)
* [Github Scrum Workflow](https://github.com/jvandemo/github-scrum-workflow)

Trash
-----

This shit should be moved to a proper place. Not here


* Github as oauth
* git.io url shortener. Can be used as script with curl
