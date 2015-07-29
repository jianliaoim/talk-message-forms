React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'message-form-quote'

  propTypes:
    # @attachment.category === 'quote'
    # @attachment.data
    #   category: String
    #   userAvatarUrl: String
    #   userName: String
    #   title: String
    #   text: String
    #   imageUrl: String
    #   redirectUrl: String
    #   faviconUrl: String
    attachment: T.object.isRequired

  renderTitle: ->
    div className: 'title', @props.attachment.data.title

  renderContent: ->
    div className: 'content', @props.attachment.data.text

  renderPicture: ->
    url = @props.attachment.data.thumbnailPicUrl
    style =
      backgroundImage: "url( #{ url } )"
    div className: 'picture', style: style

  render: ->
    div className: 'attachment-quote',
      if @props.attachment.data.title? then @renderTitle() else null
      if @props.attachment.data.text?.length > 0 then @renderContent() else null
      if @props.attachment.data.thumbnailPicUrl? then @renderPicture() else null
