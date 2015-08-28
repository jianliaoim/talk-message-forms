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
    img: '//api.adorable.io/avatars/250/image'
    name: 'Image'
  message: 'Send a image attachment.'
  attachments: [
    category: 'image'
    data:
      thumbnailUrl: '//api.adorable.io/avatars/250/image-attachment'
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
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
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
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
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
      text: '''
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        '''
      title: 'Lorem ipsum dolor sit amet.'
  ]
  isSystem: false
]
