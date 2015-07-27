React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-quote'

  render: ->
    div className: 'message-quote',
      'message-quote'
