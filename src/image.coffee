React = require 'react'

div = React.createFactory 'div'
img = React.createFactory 'img'
module.exports = React.createClass
  displayName: 'message-image'

  render: ->
    div className: 'message-image',
      img src: 'https://striker-ga.teambition.com/thumbnail/3a/83/f2618b66b28d435fb423f597d2c4.png/w/400/h/400'