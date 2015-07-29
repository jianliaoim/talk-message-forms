React = require 'react'

div = React.createFactory 'div'
img = React.createFactory 'img'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    # @attachment.category === 'image'
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

  render: ->
    div className: 'attachment-image',
      div className: 'preview',
        img src: @props.attachment.data.previewUrl
