
    // randomly paint some paws on the screen
    $(function(){
	    //if(document.all) return 
      var doc_width = self.innerWidth;
      var doc_height = self.innerHeight;

      for(var i = 0 ; i < 10 ; i++){
        var l = random(doc_width)
        var t = random(doc_height)
        var s = random(36)
        //if(s < 12) continue
        s = s + 'px'
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
