React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-file'

  render: ->
    div className: 'message-file',
      'message-file'
