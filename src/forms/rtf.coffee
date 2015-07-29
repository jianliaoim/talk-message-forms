React = require 'react'

detect = require '../util/detect'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-rtf'

  propTypes:
    # @attachment.category === 'rtf'
    # @attachment.data
    #   title: String
    #   text: String
    attachment: T.object.isRequired

  renderTitle: ->
    div className: 'title', @props.attachment.data.title

  renderContent: ->
    div className: 'content', @props.attachment.data.text

  renderPicture: ->
    includeImage = detect.extractURL @props.attachment.data.text

    if includeImage
      url = includeImage
      style =
        backgroundImage: "url( #{ url } )"
      div className: 'picture', style: style
    else
      null

  render: ->
    div className: 'attachment-rtf',
      if @props.attachment.data.title? then @renderTitle() else null
      if @props.attachment.data.text?.length > 0 then @renderContent() else null
      @renderPicture()
