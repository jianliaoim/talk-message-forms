# @attachment.category === 'image'
# @attachment.data
#   fileKey:      String
#   fileName:     String
#   fileType:     String
#   fileSize:     Number
#   fileCategory: String
#   imageWidth:   Number
#   imageHeight:  Number
#   downloadUrl:  String
#   thumbnailUrl: String
#   previewUrl:   String

React = require 'react'

div = React.createFactory 'div'
img = React.createFactory 'img'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-image'

  propTypes:
    onClick:    T.func
    attachment: T.object.isRequired

  onClick: ->
    @props.onClick?()

  render: ->
    div className: 'attachment-image', onClick: @onClick,
      div className: 'preview',
        img src: @props.attachment.data.previewUrl
