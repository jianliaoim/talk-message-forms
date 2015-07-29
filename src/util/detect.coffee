exports.extractURL = (html) ->
  match = html.match(/\<img.*?[\'\"](http(s)?:\/\/[\x21-\x7F\*]+)[\'\"].*?\>/i)
  match?[1] or undefined
