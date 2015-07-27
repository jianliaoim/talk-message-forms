React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-rtf'

  render: ->
    div className: 'message-rtf',
      'message-rtf'
