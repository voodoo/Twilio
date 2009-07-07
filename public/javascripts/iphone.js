window.onload = function() {
  setTimeout(function(){window.scrollTo(0, 1);}, 100);
  setTimeout(function(){
		if($('flash_notice')){
			//alert($('flash_notice').style.display)
			$('flash_notice').toggle()
		}
		  
  },4000)
}

function $(id) { return document.getElementById(id); }

Object.prototype.toggle = function(){
	if(this.style.display == 'none')
	  this.style.display = 'block' 
  else
    this.style.display = 'none'
}
