
// randomly paint some paws on the screen / bored
$(function(){
  if(document.all) return 
  var doc_width  = self.innerWidth;
  var doc_height = self.innerHeight;
  var top, s, l, t, s, d = null;
  for(var i = 0 ; i < 6 ; i++){
    l = random(doc_width)
    t = random(doc_height)
    s = random(36) + 12 + 'px'
    var img = document.createElement('img')
        img.src = "/images/icons/icon.png"
        img.style.left = l + 'px'
        img.style.top =  t + 'px'
        img.style.position = 'absolute'
        img.style.width    = s
        img.style.height   = s
        img.style.opacity  = Math.random()
    document.body.appendChild(img)
  }      
});
