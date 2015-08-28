cx = require 'classnames'
React = require 'react'

format = require '../util/format'

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
    return if not @props.attachment.data.title?.length
    div className: 'title', @props.attachment.data.title

  renderContent: ->
    return if not @props.attachment.data.text?.length
    text = format.htmlAsText(@props.attachment.data.text).replace(/\n+/g, ' ').trim()
    return if not text.length
    div className: 'content', text

  renderPicture: ->
    return if not @props.attachment.data.imageUrl?.length
    style =
      backgroundImage: "url( #{ @props.attachment.data.imageUrl } )"
    div className: 'picture', style: style

  render: ->
    className = cx
      'attachment-quote': true
      'is-clickable': @props.attachment.data.redirectUrl?.length

    div className: className, onClick: @onClick,
      @renderTitle()
      @renderContent()
      @renderPicture()
