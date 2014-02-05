
# wintersmith-sass

[sass](http://sass-lang.com/) plugin for [wintersmith](https://github.com/jnordberg/wintersmith)

install:

`npm install wintersmith-sass -g`
then add `wintersmith-sass` to your plugins in the wintersmith config

versioning:

If you are using wintersmith 1.0 please use version 0.1.3 else for wintersmith 2.0 please use version 0.2.*

usage:

wintersmith-sass requires the sass gem to be installed as it uses the sass cmd to compile the css files
Please see [sass](http://sass-lang.com/) for installation details

If you want to have sass output a compressed file, simply add a sass variable `$compressed: true;` to each .scss or .sass file you want compressed.

If you want to have sass compile with Compass imports available, simply add a sass variable `$compass: true;` to each .scss or .sass file you want compile with Compass.

As per sass guidelines, all non partial .scss files will be parsed into a compiled css file and output. Partials, scss files beginning with _ (underscore) will be ignored unless imported.

contributors:
mpdreamz
bmac
gordonwritescode
