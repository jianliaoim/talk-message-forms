React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'message-file'

  render: ->
    div className: 'message-file',
      div className: 'attachment', onClick: @onClick,
        div className: "square", style: {backgroundColor: 'orange'},
          'S'
        div className: 'name', '啊啊啊啊啊啊.sketch'
        div className: 'size', '25.6M'
        #@renderProgress()