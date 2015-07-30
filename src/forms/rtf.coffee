# @attachment.category === 'rtf'
# @attachment.data
#   text:  String
#   title: String

React = require 'react'

detect = require '../util/detect'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-rtf'

  propTypes:
    onClick:    T.func
    attachment: T.object.isRequired

  onClick: ->
    @props.onClick?()

  renderTitle: ->
    if @props.attachment.data.title?.length
      div className: 'title', @props.attachment.data.title

  renderContent: ->
    if @props.attachment.data.text?.length
      div className: 'content', @props.attachment.data.text

  renderPicture: ->
    includeImage = detect.extractURL @props.attachment.data.text

    if includeImage
      url = includeImage
      style =
        backgroundImage: "url( #{ url } )"
      div className: 'picture', style: style

  render: ->
    div className: 'attachment-rtf', onClick: @onClick,
      @renderTitle()
      @renderContent()
      @renderPicture()
