React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-mini-image'

  propTypes:
    onClick:    T.func
    attachment: T.object.isRequired

  render: ->
    div className: 'attachment-mini-image',
      @props.attachment
