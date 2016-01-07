FILE_CATEGORY = [ 'text', 'image', 'application', 'video', 'audio' ]

FILE_TYPE =
  text: [ 'txt', 'html', 'css', 'js', 'xml']
  image: [ 'ps', 'ai', 'ae' ]
  application: [ 'sketch',
    [ 'ppt', 'pptx' ],
    [ 'doc', 'docx' ],
    [ 'xls', 'xlsx' ],
    'numbers', 'pages', 'keynotes', 'pdf',
    [ 'zip', 'rar', 'dmg' ]
  ]
  video: [ 'mov' ]
  audio: [ 'acc' ]

findType = (type, arr) ->
  pos = -1
  arr.forEach (item, index) ->
    if item instanceof Array
      pos = index if type in item
    else
      pos = index if type is item

  pos

exports.get = (data) ->
  category = data.fileCategory

  x = FILE_CATEGORY.indexOf(category)
  y = findType(data.fileType, FILE_TYPE[category])

  if y < 0
    if category in [ 'image', 'video', 'audio' ]
      y = FILE_TYPE.length - 1
    else
      x = FILE_CATEGORY.length - 1
      y = 0

  "#{x * -32}px #{y * -40}px"
