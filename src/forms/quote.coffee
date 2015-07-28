React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-quote'

  propTypes:
    attachment: T.object.isRequired

  render: ->
    div className: 'message-forms-quote',
      @props.attachment
