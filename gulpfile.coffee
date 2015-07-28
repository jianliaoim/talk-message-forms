'use strict'

gulp     = require('gulp')
sequence = require('run-sequence')
exec     = require('child_process').exec

env =
  dev: true
  main: 'http://localhost:8080/build/main.js'

# compile .coffee to .js
gulp.task 'script', ->
  coffee = require('gulp-coffee')
  gulp
  .src 'src/**/*.coffee'
  .pipe coffee()
  .pipe gulp.dest('lib/')

# compile .cirru to .html
gulp.task 'html', (cb) ->
  require('cirru-script/lib/register')
  html = require('./template.cirru')
  fs = require('fs')
  assets = undefined
  unless env.dev
    assets = require('./build/assets.json')
    env.main = './build/' + assets.main
  fs.writeFile 'index.html', html(env), cb

# clean up
gulp.task 'del', (cb) ->
  del = require('del')
  del [ 'build', 'lib' ], cb

# build
gulp.task 'webpack', (cb) ->
  command = if env.dev then 'webpack' else 'webpack --config webpack.min.coffee'
  exec command, (err, stdout, stderr) ->
    console.log stdout
    console.log stderr
    cb err

gulp.task 'build', (cb) ->
  env.dev = false
  sequence 'del', 'webpack', 'html', cb

# publish
gulp.task 'rsync', (cb) ->
  opt =
    args: ['--verbose']
    deleteAll: true
    dest: 'talk-ui:/teambition/server/talk-ui/talk-message-forms'
    recursive: true
    src: ['index.html', 'build']
    ssh: true
  wrapper = require 'rsyncwrapper'
  wrapper.rsync opt, (error, stdout, stderr, cmd) ->
    if error?
      throw error
    console.error stderr
    console.log cmd
    cb()
