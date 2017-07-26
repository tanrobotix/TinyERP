$(".bj").ready(function(){
	var d = new Date();
		if (d.getHours() < 12){
			$(".bj").append("Good morning");
		}
		else if ( 12 <= d.getHours() && d.getHours() <= 17){
			$(".bj").append("Good afternoon");
		}
		else if (d.getHours() > 17){
			$(".bj").append("Good evening");
		}
	}	
);

$(window).on('load', function formatAMPM(){
  var date = new Date();
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var seconds = date.getSeconds();

  var ampm = hours >= 12 ? 'PM' : 'AM';
  hours = hours % 12;
  hours = hours ? hours : 12;
  minutes = minutes < 10 ? '0'+ minutes : minutes;
  seconds = seconds < 10 ? '0' + seconds : seconds;
  var strTime1 = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
 
  $(".lt").html(strTime1);
  var t = setTimeout(formatAMPM, 1000);
});

$(window).on('load', function updateT(){
	var date = new Date();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();

	var ampm = hours >= 12 ? 'PM' : 'AM';
	hours = hours % 12;

	hours = hours ? hours : 12;
	minutes = minutes < 10 ? '0'+ minutes : minutes;
	seconds = seconds < 10 ? '0' + seconds : seconds;
	var strTime = hours + ':' + minutes + ' ' + ampm;

	$(".ct").html(strTime);
	var t = setTimeout(updateT, 1000);
});
