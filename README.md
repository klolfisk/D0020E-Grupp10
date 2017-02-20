D0021E
=======
This is a project for the course D0020E at Luleå University of Technology.
The goal of the project is to make a web-based GUI for administering Docker containers.

The system should:
* Allow for administration of a docker session from a web interface.
* Be simple (both in implementation and usage).
* Be secure.

We have chosen to not focus on the following features:
* Good looks.
* Network configuration. This is a simple plug and play solution, locally. It will not set up a network tunnel for you.
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

Git branch naming conventions
-----------------------------

### Standard branches

These two branches will always exist and should only be written to by pull requests:

* `master` will be merged to from `devel`after every working sprint demo and should always be a stable "release". Only merge from devel and maybe hot fixes if there are critical bugs. Only merging by reviewed pull requests.
* `devel` will be merged to before every sprint demo, by pull request. All wip branches should be merged here when done.

### Work branches

These naming conventions should be used during active development.

* `wip/branch_name` these are work in progress branches and should generally have the same name as the corresponding scrum story. A `wip` branch should, when finished, be merged into `devel`

* `test/testing_something` should be used when you want to test something on a `wip` branch. If a test branch is successful it should be merged back into the `wip` branch it was branched out from. We generally don't push these branches to remote, unless there is a specific need to do so.

* `fix/#issuenumber_issuename` should be used to fix bugs. Remember to both file an issue in GitHub AND the icebox in Pivotal Tracker.

Reading material
----------------

Get github Student developer pack
* [Student developer pack](https://education.github.com/pack)

Git branching model
* [A successfull Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)

Agile workflow in git:
* [GitHub Issues Can be Agile if You Do it Right](https://zube.io/blog/agile-project-management-workflow-for-github-issues/)
* [waffle.io](https://waffle.io/)
* [How GitHub uses GitHub to build GitHub](https://www.youtube.com/watch?v=qyz3jkOBbQY)
* [Github Scrum Workflow](https://github.com/jvandemo/github-scrum-workflow)
>>>>>>> master
