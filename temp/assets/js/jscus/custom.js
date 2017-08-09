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

/*$(window).on('load', function lyrics() {
			switch(seconds) {
				case 1: 
					 $("#lyrics").html("Xi, xà bệt khi cha ché vun ra tô mi rành đố tế");
					break;
				case 2: 
					 $("#lyrics").html("Ten gồ khe vài la gồn tia gố ôi");
					break;
				case 3: 
					 $("#lyrics").html("Vi, kề tù mi la đá da sta va da màm đô mén em. ");
					break;
				case 4: 
					 $("#lyrics").html("Moe xà rme cà mi nồ kê dố voi ");
					break;
				case 5: 
					 $("#lyrics").html("Tu, tòe rà xè lima lì đa xồ dén mê tà ");
					break;
				case 6: 
					 $("#lyrics").html("Mề gồ da xê cóng mê phói da r-mân gối plan ");
					break;
				case 7: 
					 $("#lyrics").html("Sừ rù cù pình xa lùa xe xì le đén pú xô ");
					 break;
				case 8: 
					 $("#lyrics").html("Sừ rù cù pình xa lùa xe xì le đén pú xô ");
					 break;
				case 9: 
					 $("#lyrics").html("Sừ rù cù pình xa lùa xe xì le đén pú xô ");
					 break;
				
				default: break;
				}
				
});*/