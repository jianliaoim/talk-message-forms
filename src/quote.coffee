React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-quote'

  render: ->
    div className: 'message-quote',
      'message-quote'

    imageUrl = 'http://striker.project.ci/thumbnail/cc/b2/e231bab22208e3bb7dd5b396ad44.jpg/w/400/h/400'

    detailStyle =
      width: if imageUrl? then 360 else 470
    styleSmall =
      backgroundImage: "url(#{imageUrl})"


    div className: 'message-quote', onClick: @onClick,
      div className: 'title', 'React.js + Flux'
      div className: 'message', 'adasdasdasdasdasdasdasdjnasdjasidjas,asdjiaosdjioasdjiosadj,asdasdoijiosadfjisodafjsiodfjsdiofjsdiofjisdoj'
      div className: 'picture', style: styleSmall