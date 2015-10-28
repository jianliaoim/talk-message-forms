React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-message'

  propTypes:
    onClick:    T.func

  onClick: (event) ->
    event.stopPropagation()
    @props.onClick?()

  render: ->
    div className: 'attachment-message', onClick: @onClick,
      @props.children
