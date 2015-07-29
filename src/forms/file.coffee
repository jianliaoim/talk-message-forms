React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-file'

  propTypes:
    attachment: T.object.isRequired

  render: ->
    div className: 'attachment-file',
      div className: 'extension', @props.attachment.data.fileType
      div className: 'name', @props.attachment.data.fileName
