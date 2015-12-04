
localeImage = require './local-image'

module.exports = [
  createTime: 'a few seconds ago'
  avatar:
    img: '//api.adorable.io/avatars/250/jianliao'
    name: 'Jianliao.com'
  message: 'Below are test messages of jianliao.com\'s message forms, don\'t be so serious.'
  attachments: []
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/message'
    name: 'Message'
  message: 'Default message, without any attachments or bonus.'
  attachments: []
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/file'
    name: 'File'
  message: 'Send a file attachment.'
  attachments: [
    category: 'file'
    data:
      fileType: 'js'
      fileName: 'hey'
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/file'
    name: 'File'
  message: 'File attachment with progress.'
  attachments: [
    category: 'file'
    data:
      fileType: 'js'
      fileName: 'hey'
    progress: 0.5
    isUploading: true
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/image'
    name: 'Image'
  message: 'An image being downloaded'
  attachments: [
    category: 'image'
    data:
      thumbnailUrl: '//d13yacurqjgara.cloudfront.net/users/6084/screenshots/2277803/thewinds3.png'
      imageWidth: 800
      imageHeight: 600
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/image'
    name: 'Image'
  message: 'An image being downloaded'
  attachments: [
    category: 'image'
    data:
      thumbnailUrl: '//d13yacurqjgara.cloudfront.net/users/159888/screenshots/2274849/everest-01.png'
      imageWidth: 800
      imageHeight: 600
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/image'
    name: 'Image'
  message: 'An image being downloaded'
  attachments: [
    category: 'image'
    data:
      thumbnailUrl: '//d13yacurqjgara.cloudfront.net/users/6084/screenshots/2283224/charitywords.png'
      imageWidth: 800
      imageHeight: 600
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/image'
    name: 'Image'
  message: 'An image being uploaded.'
  attachments: [
    category: 'image'
    data:
      thumbnailUrl: localeImage.one
      imageWidth: 400
      imageHeight: 300
    isUploading: true
    progress: 0.5
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/image'
    name: 'Image'
  message: 'An image finished upload.'
  attachments: [
    category: 'image'
    data:
      thumbnailUrl: localeImage.two
      imageWidth: 400
      imageHeight: 300
    isUploading: false
    progress: 1
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/image'
    name: 'Image'
  message: 'An image with bad thumbnailUrl.'
  attachments: [
    category: 'image'
    data:
      thumbnailUrl: 'asdf'
      imageWidth: 200
      imageHeight: 200
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/quote-clickable'
    name: 'Quote (Clickable)'
  message: 'Send a quote attachment which is clickable.'
  attachments: [
    category: 'quote'
    data:
      redirectUrl: 'http://jianliao.com'
      text: '''
        Lorem &nbsp; Ipsum &nbsp; is &nbsp; simply &nbsp; dummy &nbsp; text &nbsp; of &nbsp; the &nbsp; printing &nbsp; and &nbsp; typesetting &nbsp; industry.\n
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n
        It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n
        '''
      title: 'Lorem ipsum dolor sit amet.'
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/quote-not-clickable'
    name: 'Quote'
  message: 'Send a quote attachment which is not clickable.'
  attachments: [
    category: 'quote'
    data:
      text: '''
        <div>Lorem &nbsp; Ipsum &nbsp; is &nbsp; simply &nbsp; dummy &nbsp; text &nbsp; of &nbsp; the &nbsp; printing &nbsp; and &nbsp; typesetting &nbsp; industry.</div>\n
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n
        It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n
        '''
      title: 'Lorem ipsum dolor sit amet.'
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/rtf'
    name: 'RTF'
  message: 'Send a rtf attachment.'
  attachments: [
    category: 'rtf'
    data:
      text: '</div></h2><script>alert(1)</scirpt>this is a broken html
        <p> this is a paragraph</p><p>this is another paragraph </p>
        <img></img>
        <ul><li>aaa</li><li>bbb</li></ul>
        '
      title: 'Lorem ipsum dolor sit amet.'
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/rtf'
    name: 'Quote'
  message: 'Quote with html'
  attachments: [
    category: 'quote'
    data:
      text: '''
        <script>alert(123)</script>
        <p>this is a paragraph</p><p>this is another paragraph</p><div style="background-image: url(http://www.w3schools.com/jsref/img_tree.png);"></div>
        <a href=""><img src="//api.adorable.io/avatars/250/rtf"></img></a>
        2015-11-23 <br/>
        <br/>
        <b>Teambition:</b>
        <br/>
      '''
      title: 'A super long title that does not have any meaning at all.'
  ]
  isSystem: false
,
  createTime: 'A few minutes ago'
  avatar:
    img: '//api.adorable.io/avatars/250/rtf'
    name: 'Quote'
  message: 'Quote with html'
  attachments: [
    category: 'quote'
    data:
      text: '''
        <table>
          <thead>
            <tr>
              <th>Metrics&nbsp;&nbsp;</th>
              <th>3 week ago&nbsp;&nbsp;</th>
              <th>2 week ago&nbsp;&nbsp;</th>
              <th>Last week&nbsp;&nbsp;</th>
              <th>Yesterday&nbsp;&nbsp;</th>
              <th>Comparison</th>
            </tr>
          </thead>
          <tbody>

            <tr>
              <td>active user</td>
                <td style='text-align: right'>27242&nbsp;&nbsp;</td>
                <td style='text-align: right'>27557&nbsp;&nbsp;</td>
                <td style='text-align: right'>27936&nbsp;&nbsp;</td>
                <td style='text-align: right'>27935&nbsp;&nbsp;</td>
                <td style="color: green; text-align: right">1.3%</td>
            </tr>

            <tr>
              <td>new user</td>
                <td style='text-align: right'>2007&nbsp;&nbsp;</td>
                <td style='text-align: right'>2005&nbsp;&nbsp;</td>
                <td style='text-align: right'>1944&nbsp;&nbsp;</td>
                <td style='text-align: right'>1853&nbsp;&nbsp;</td>
                <td style="color: red; text-align: right">-6.7%</td>
            </tr>

          </tbody>
        </table>
      '''
      title: 'A super long title that does not have any meaning at all.'
  ]
  isSystem: false
]
