# Data Software Catalogue

A Rails application created to keep track of the data software used by
different government departments.

## Current status
This application has been archived, as attention has moved elsewhere.

Basic functionality is provided including a search facility. Development
could continue if the need for such a catalogue becomes a priority.

## Deployment

The application is build on Ruby on Rails, with a postgres database.

### CSS

SASS is used to compile CSS via [Dart SASS](https://sass-lang.com/dart-sass).

To build the CSS locally from the app/assets/stylesheets/*.scss files, run
the following command:

```
rake dartsass:build
```

This will compile the assets into the file app/assets/builds/application.css

### JavaScript

Some JavaScript functionality is provided via node packages (for example,
govuk-frontend). The code for these packages is not stored in the git
repository, so will need to be loaded prior to starting the app.

Run the following command to load the node packages into node_modules:

```
npm install
```
