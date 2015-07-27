React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-snippet'

  render: ->
    div className: 'message-snippet',
      'message-snippet'
