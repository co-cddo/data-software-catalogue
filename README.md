# README

## Deployment

### CSS

SASS is used to compile CSS via [Dart SASS](https://sass-lang.com/dart-sass).

To build the CSS locally from the app/assets/stylesheets/*.scss files, run
the following command:

```
rake dartsass:build
```

This will compile the assets into the file app/assets/builds/application.css
