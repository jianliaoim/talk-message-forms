cx = require 'classnames'
React = require 'react'

format = require '../util/format'
detect = require '../util/detect'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-quote'

  propTypes:
    lang: T.string
    onClick:    T.func
    attachment: T.object.isRequired

  getDefaultProps: ->
    lang: 'zh'

  onClick: (event) ->
    event.stopPropagation()
    @props.onClick?()

  renderTitle: ->
    return if not @props.attachment.data.title?.length
    if detect.isFromTeambition(@props.attachment.data.redirectUrl) and @props.attachment.data.category is 'url'
      title = if @props.lang is 'zh' then "访问 Teambition 查看更多" else "Check out Teambition for more information"
    else
      title = @props.attachment.data.title
    div className: 'title', title

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
      'is-clickable': @props.attachment.data.redirectUrl?.length or @props.attachment.data.text?.length

    div className: className, onClick: @onClick,
      @renderTitle()
      @renderContent()
      @renderPicture()
