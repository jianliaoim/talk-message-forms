React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-rtf'

  propTypes:
    attachment: T.object.isRequired

  render: ->
    div className: 'message-forms-rtf',
      @props.attachment
