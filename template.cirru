var
  stir $ require :stir-template

var
  ({}~ html head title body meta script link div a span) stir

var
  line $ \ (text) (div ({} (:className :line)) text)

= module.exports $ \ (data)
  return $ stir.render
    stir.doctype
    html null
      head null
        title null ":Talk Message Forms"
        meta $ object (:charset :utf-8)
        link $ object (:rel :icon)
          :href :http://tp4.sinaimg.cn/5592259015/180/5725970590/1
        cond (not data.dev)
          link $ {} (:rel :stylesheet)
            :href data.style
          , undefined
        script $ object (:src data.vendor) (:defer true)
        script $ object (:src data.main) (:defer true)
      body null
        div ({} (:class :intro))
          div ({} (:class :title)) ":The Message Structure and Style of jianliao.com."
          div null
            span null ":Read more at "
            a
              {} (:href :http://github.com/teambition/talk-message-forms)
              , :github.com/teambition/talk-message-forms
            span null :.
        div ({} (:id :example))
