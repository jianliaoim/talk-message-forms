xss = require 'xss'

htmlxss = new xss.FilterXSS
  whiteList: []
  stripIgnoreTag: true
  stripIgnoreTagBody: ['script']
  onTag: (tag, html, options) ->
    if tag is 'p' and options.isClosing
      '\n\n'

rtfxss = new xss.FilterXSS
  onTag: (tag, html, options) ->
    return '[image]' if tag is 'img' and not options.isClosing

exports.parseHtml = (html) ->
  htmlxss.process(html)
    .replace(/^[^\S\n]+/gm, '') # remove all leading white space
    .replace(/\n{2,}/g, '\n\n') # shrink newlines
    .trim()
    .split('\n').slice(0, 5).join('\n') # keep only first 5 lines

exports.parseRTF = (html) ->
  rtfxss.process(html)
