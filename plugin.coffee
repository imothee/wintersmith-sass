child_process = require 'child_process'
path = require 'path'
fs = require 'fs'

module.exports = (wintersmith, callback) ->

  class SassPlugin extends wintersmith.ContentPlugin

    constructor: (@_filename, @_base, @_source) ->

    getFilename: ->
      @_filename.replace /scss$/, 'css'

    render: (locals, contents, templates, callback) ->
      
      if path.basename(@_filename).charAt(0) == '_'
        callback null
      else
        command = path.join(@_base, @_filename)
        
        if @_source.search(/(\$compressed:)([ ]*)(true;)/ig) isnt -1
          command = '-t compressed '+command
        
        c = child_process.exec 'sass '+command, (error, stdout, stderr) ->
          if error
            callback error
          else
            callback null, new Buffer stdout
        
  SassPlugin.fromFile = (filename, base, callback) ->
    fs.readFile path.join(base, filename), (error, buffer) ->
      if error
        callback error
      else
        callback null, new SassPlugin filename, base, buffer.toString()

  wintersmith.registerContentPlugin 'styles', '**/*.scss', SassPlugin
  callback()
