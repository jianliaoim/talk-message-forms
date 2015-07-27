React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-speech'

  render: ->
    div className: 'message-speech',
      'message-speech'
