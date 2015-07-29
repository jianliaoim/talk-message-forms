React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-file'

  propTypes:
    # @attachment.category === 'file'
    # @attachment.data
    #   fileKey: String
    #   fileName: String
    #   fileType: String
    #   fileSize: Number
    #   fileCategory: String
    #   imageWidth: Number
    #   imageHeight: Number
    #   downloadUrl: String
    #   thumbnailUrl: String
    #   previewUrl: String
    attachment: T.object.isRequired
    color:      T.string

  render: ->
    div className: 'attachment-file',
      div className: 'extension', @props.attachment.data.fileType
      div className: 'name', @props.attachment.data.fileName
