
# wintersmith-sass

[sass](http://sass-lang.com/) plugin for [wintersmith](https://github.com/jnordberg/wintersmith)

install:

currently please download the folder into your wintersmith project and add the folder to the plugins
`"./wintersmith-sass"` in the wintersmith config

an npm module is planned

usage:

wintersmith-sass requires the sass gem to be installed as it uses the sass cmd to compile the css files
Please see [sass](http://sass-lang.com/) for installation details

As per sass guidelines, all non partial .scss files will be parsed into a compiled css file and output. Partials, scss files beginning with _ (underscore) will be ignored unless imported.
