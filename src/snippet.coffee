React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-snippet'

  render: ->
    div className: 'message-snippet',
      div className: 'title', 'Javascript'
      div className: 'message', 'var a="b"'