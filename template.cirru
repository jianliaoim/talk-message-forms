var
  stir $ require :stir-template

var
  (object~ html head title body meta script link div a span) stir

var
  line $ \ (text)
    return $ div null text

= module.exports $ \ (data)
  return $ stir.render
    stir.doctype
    html null
      head null
        title null ":Talk Message Forms"
        meta $ object (:charset :utf-8)
        link $ object (:rel :icon)
          :href :http://tp4.sinaimg.cn/5592259015/180/5725970590/1
        script $ object (:src data.main) (:defer true)
      body null
        div
          object (:class :intro)
          line ":The Message Structure and Style of Jianliao.com"
          div null
            span null ":Read more at "
            a
              object (:href :http://github.com/teambition/talk-message-forms)
              , :http://github.com/teambition/talk-message-forms
            span null :.
        div
          object (:id :app)
