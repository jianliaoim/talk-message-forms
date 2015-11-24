xss = require 'xss'
truncate = require 'html-truncate'

myxss = new xss.FilterXSS
  onTagAttr: (tag) ->
    return '' if tag is 'img'

exports.parseHtml = (html) ->
  html = myxss.process(html).trim()
  truncate(html, 2000, {ellipsis: '...'})
