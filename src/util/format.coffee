exports.htmlAsText = (html) ->
  el = document.createElement 'div'
  el.innerHTML = html
  el.innerText or el.textContent