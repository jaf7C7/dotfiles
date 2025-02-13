# Project Ideas

Create a project directory for each project,
add a requirement,
write a test,
make the test pass.
Refactor and repeat.

## General utilities

General useful little tools, should be mostly written in python.

### Ideas

- A cli utility to find the declaration of a reference in a file

  - For python only (at first)
  - Takes (line, column) params
  - Reads the file, finds the symbol at that point and returns the
    file:line:col where it is declared

- A cli emoji/unicode symbol picker

  - pops up a fuzzy finder search box
  - refines results on each keystroke
  - inserts selected emoji and exits
  - can also take a char and return the unicode code point
  - can also insert char by codepoint

- A file watcher

  - written in python
  - runs arbitrary command when files change

- A hot-reloading web server written in python

  - Like browser-sync but python

- A markdown previewer with hot reloading:

  - Written in python
  - Edit markdown wherever
  - Changes are rendered in the browser when the file is saved, with no
    refresh necessary

- Custom formatters for gcc-like output for test runners and linters

  - format `<file>:<line>:<col>: <err-type>: <err-message>`
  - eslint
  - node --test
  - jest
  - etc.

- conway's game of life

  - python
  - in the browser (canvas api?)
  - in the terminal (textual)

## Web Apps

Your app should have:

- Database interaction (store/retrieve data).
- login system with different levels, e.g. blog author, login to
  comment/review, or guest login. This depends on the app and using
  case.
- Intuitive, well built user interface (UI). In other words, a nice
  front-end side of the web app. It does hurt the webapp if the back-end
  provides great functionality while the user interface is rubbish!! You
  can use a template if you want.

### Hosting:

- https://railway.app/
- https://www.netlify.com

### Ideas

- Calculator (vanilla everything)

- Small JS Projects:
  <https://www.youtube.com/playlist?list=PLZlA0Gpn_vH8DWL14Wud_m8NeNNbYKOkj>

- A [Kanban board](https://www.youtube.com/watch?v=R8dYLbJiTUE)

- A [HTML Canvas project](https://www.youtube.com/playlist?list=PLYElE_rzEw_v8TXJ_ITSSBP_ypUKfQ7K-).

- A clone of [this](https://software.hixie.ch/utilities/js/live-dom-viewer/)

- An algorithm visualiser clone

- Create a web dev playground (jsfiddle clone)

- Who's my MP? enter postcode and get your MP info (commons api)

- get dirtiest restaurant in your area (public api)

  - plot on map

- Lorem Picsum clone (API wrapper for unsplash)

- Twitter threadreader app clone

- A currency converter API like [this one](https://freecurrencyapi.com/)

- GitHub Pages portfolio site:

  - Hosts front-end projects, and the front-end of full-stack projects.
  - The backend of full-stack projects is hosted on some free service
    and accessed via an API
  - Frontend makes API requests to the hosted backend, so it looks like
    the site has a backend.
  - Website theme switcher (sun to moon toggle) a la: -
    https://alexandersandberg.github.io/theme-switcher/
  - Very simple design
    - https://deadsimplesites.com/
    - https://nazhamid.com/?ref=deadsimplesites
  - HTML/CSS only as much as possible
  - Hosts/links to live projects
  - Can upload markdown files via API call and a blog post will be
    added.
  - Make a web interface to try out my CLI projects:
    - Someone must have done it before (xterm.js?)
    - Make an API for the CLI which returns an object with `stdOut`,
      `stdErr` and `exitCode` properties
    - The front-end just simluates a terminal, but with only the CLI
      program available (and maybe an `ls` command if there are files
      available)

- build a terminal emulator for in the browser

- Build front-ends for a few public api's before trying to make your own
  api.

  - See https://github.com/public-apis

- slowly build up to a more complex back end app over several projects
  of increasing complexity: backend project ideas
  https://medium.com/@ayushojha010/30-backend-project-ideas-for-beginners-learning-go-from-restful-apis-to-machine-learning-65232171c2ac

- look at more github profiles and projects for ideas:
  https://github.com/ZacMossHK

- some web scraping analytics a la
  https://github.com/ZacMossHK/Busiest-Climbers-UKC

- independent birmingham web app

  - add a business with location, description, website, hours etc
  - add markers to all businesses using the google maps api

- some data sciency thing:

  - using large public data sets
  - or web scraping to get your own data
  - doing some analysis (what? how?)
  - and or data visualisation
  - and or making a rest api for the service
  - watch some tutorials

- get your local mp info (voting record, contact, questions asked etc.)

- see what public api's the local gov't offers

- AI summary of parliamentary questions

- clone of twitter threadreader app (X-pander)

### Links

- https://prismic.io/blog/13-best-api-project-ideas
- https://medium.com/@ayushojha010/a-30-day-plan-for-building-a-portfolio-of-go-projects-f2906040efc5
- https://github.com/practical-tutorials/project-based-learning?tab=readme-ov-file
