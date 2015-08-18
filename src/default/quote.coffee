React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-quote'

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
    return if not @props.attachment.data.imageUrl?.length
    style =
      if @props.attachment.data.imageUrl isnt ''
        backgroundImage: "url(#{ @props.attachment.data.imageUrl })"
    div className: 'picture', style: style

  render: ->
    div className: 'attachment-quote', onClick: @onClick,
      @renderTitle()
      @renderContent()
      @renderPicture()
