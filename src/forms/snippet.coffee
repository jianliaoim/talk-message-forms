React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-snippet'

  propTypes:
    attachment: T.object.isRequired

  render: ->
    div className: 'message-forms-snippet',
      @props.attachment
