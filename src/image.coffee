React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-image'

  render: ->
    div className: 'message-image',
      'message-image'
