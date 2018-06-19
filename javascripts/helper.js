$(window).resize(function(){
	setContentOffset();
})

setContentOffset =function() {
	 headerHeight = document.getElementsByClassName("header");
	 $("#map").css("padding-top" , $(headerHeight).height()+"px");
}

function openMenu(x) {
	x.classList.toggle("change");

	if($(x).hasClass("change")) {
		$(".List").css("display","block");
	}
	else {
		$(".List").css("display","none");
	}
}

$(document).ready(function(){
	setContentOffset();
})