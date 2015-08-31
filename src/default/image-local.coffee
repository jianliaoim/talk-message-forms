React = require 'react'

img = React.createFactory 'img'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'image-local'

  propTypes:
    onClick: T.func
    onLoaded: T.func
    src: T.string

  shouldComponentUpdate: (next) ->
    return next.src? and next.src.indexOf('data:') is 0

  onClick: ->
    @props.onClick?()

  onLoaded: ->
    @props.onLoaded?()

  render: ->
    img
      src: @props.src
      onClick: @onClick
      onLoaded: @onLoaded
