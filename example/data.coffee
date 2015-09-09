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
      thumbnailUrl: '//api.adorable.io/avatars/250/image-attachment'
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
      thumbnailUrl: 'data:image/gif;base64,R0lGODlhEAAQAMQAAORHHOVSKudfOulrSOp3WOyDZu6QdvCchPGolfO0o/XBs/fNwfjZ0frl3/zy7////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAkAABAALAAAAAAQABAAAAVVICSOZGlCQAosJ6mu7fiyZeKqNKToQGDsM8hBADgUXoGAiqhSvp5QAnQKGIgUhwFUYLCVDFCrKUE1lBavAViFIDlTImbKC5Gm2hB0SlBCBMQiB0UjIQA7'
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
      thumbnailUrl: 'data:image/gif;base64,R0lGODlhEAAQAMQAAORHHOVSKudfOulrSOp3WOyDZu6QdvCchPGolfO0o/XBs/fNwfjZ0frl3/zy7////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAkAABAALAAAAAAQABAAAAVVICSOZGlCQAosJ6mu7fiyZeKqNKToQGDsM8hBADgUXoGAiqhSvp5QAnQKGIgUhwFUYLCVDFCrKUE1lBavAViFIDlTImbKC5Gm2hB0SlBCBMQiB0UjIQA7'
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
