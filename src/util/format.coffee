xss = require 'xss'

exports.htmlAsText = (html) ->
  # https://github.com/leizongmin/js-xss/blob/master/example/strip_tag.js
  xss html,
    whiteList: []
    stripIgnoreTag: true
    stripIgnoreTagBody: ['script']
