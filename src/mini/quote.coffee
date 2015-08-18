React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-mini-quote'

  propTypes:
    onClick:    T.func
    attachment: T.object.isRequired

  render: ->
    div className: 'attachment-mini-quote',
      @props.attachment
