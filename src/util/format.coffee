xss = require 'xss'

myxss = new xss.FilterXSS
  whiteList: []
  stripIgnoreTag: true
  stripIgnoreTagBody: ['script']

exports.parseHtml = (html) ->
  myxss.process(html)
    .replace(/^\s+/gm, '') # remove all leading white space
    .replace(/(?:\n+)+\n*/g, '\n') # combine all multiple occurrence of newline
    .split('\n').slice(0, 5).join('\n') # keep only first 5 lines
