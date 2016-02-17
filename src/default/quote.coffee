cx = require 'classnames'
React = require 'react'

format = require '../util/format'
detect = require '../util/detect'

div = React.createFactory 'div'
span = React.createFactory 'span'
a = React.createFactory 'a'

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
    div className: 'title',
      span null, title
      if @props.attachment.data.redirectUrl
        span null,
          a className: 'link', href: @props.attachment.data.redirectUrl, target: '_blank',
            span className: 'ti ti-chain'

  renderContent: ->
    return if not @props.attachment.data.text?.length
    text = format.parseHtml(@props.attachment.data.text)
    return if not text.length
    div className: 'content', dangerouslySetInnerHTML: __html: text

  renderPicture: ->
    return if not @props.attachment.data.imageUrl?.length
    style =
      backgroundImage: "url( #{ @props.attachment.data.imageUrl } )"
    div className: 'picture', style: style

  render: ->
    color = @props.attachment.data.color?.toLowerCase() or 'default'

    className = cx 'attachment-quote', "is-#{color}",
      'is-clickable': @props.attachment.data.text?.length

    div className: className, onClick: @onClick,
      @renderTitle()
      @renderContent()
      @renderPicture()
