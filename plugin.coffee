child_process = require 'child_process'
path = require 'path'
fs = require 'fs'

module.exports = (wintersmith, callback) ->
  options = wintersmith.config.sass or {}

  class SassPlugin extends wintersmith.ContentPlugin

    constructor: (@_filename, @_source) ->

    getFilename: ->
      @_filename.relative.replace /sass|scss$/g, 'css'

    getView: ->
      return (env, locals, contents, templates, callback) ->
        if path.basename(@_filename.full).charAt(0) == '_'
          callback null
        else
          command = [@_filename.full]
          
          if @_source.search(/(\$compressed:)([ ]*)(true;)/ig) isnt -1
            command = ['-t',  'compressed', @_filename.full]

          onComplete = (error, stdout, stderr) ->
            if error
              callback error
            else
              callback null, new Buffer stdout

          c = child_process.execFile 'sass', command, options, onComplete
        
  SassPlugin.fromFile = (filename, callback) ->
    fs.readFile filename.full, (error, buffer) ->
      if error
        callback error
      else
        callback null, new SassPlugin filename, buffer.toString()


  wintersmith.registerContentPlugin 'styles', '**/*.*(scss|sass)', SassPlugin
  callback()
