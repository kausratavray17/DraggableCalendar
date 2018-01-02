<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">-->
<title>Interactive Calendar</title>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel='stylesheet'>
<link href='fullcalendar.min.css' rel='stylesheet' />
<link href='fullcalendar.css' rel='stylesheet' />
<link href='fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/font-icon.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://bootswatch.com/solar/bootstrap.min.css">

<script src='https://code.jquery.com/jquery-1.12.4.js'></script>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
<!--<script src='lib/jquery.min.js'></script>-->
<script src='js/theme-chooser.js'></script>
<script src='lib/moment.min.js'></script>
<script src='fullcalendar.min.js'></script>

<style>
  #services {padding:50px;}
  #calendar {
		max-width: 900px;
		margin: 0 auto;
		padding:30px;
	}
	
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; font-family:"Open Sans", Arial, sans-serif; }
    div#users-contain { width: 350px; margin: 20px 0; background-color:red;}
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>


<script>

	$(document).ready(function() {
		
		var eventName;
		var eventColor;
		
		function createEventUtil(title,color,start,end) {
				var title = title;
				var color = color;
				var eventData;
				if(title) {
					if($('#check').is(":checked") == true){
						for(var i=0; i<$('#numevent').val(); i++) {
							//alert(i);
							var freq = $('#rfreq').val();
							var unit = $('#runit').val();
							eventData = {
								id: 1,
								title: title,
								start: moment(start).add(freq*i,unit).format('YYYY-MM-DD'),
								end: moment(end).add(freq*i,unit).format('YYYY-MM-DD'),
								color: color,
								allDay: true
							};
							$('#calendar').fullCalendar('renderEvent', eventData, true);
						}
					}
					else{
						eventData = {
							id: 11,
							title: title,
							start: moment(start).format('YYYY-MM-DD'),
							end: moment(end).format('YYYY-MM-DD'),
							color: color,
							allDay: true
						};
						$('#calendar').fullCalendar('renderEvent', eventData, true);
						
					}
				}
				dialog.dialog( "close" );
				$('#calendar').fullCalendar('unselect');
		}
		
		function addUser() {
			eventName = $('#ename').val();
			eventColor = $('#ecolor').val();
			
			createEventUtil(eventName, eventColor,s,e);
			
		}
		
		function createEvent() {
			dialog.dialog( "open" );
		}
	  
		var calendar = $('#calendar').fullCalendar({
			themeSystem: 'bootstrap3',
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate: '2017-09-12',
			navLinks: true,
			editable: true,
			eventLimit: true,
			selectable: true,
			//weekends: false,
			select: function(start, end, jsEvent, view) {
				var allDay = !start.hasTime() && !end.hasTime();
				s = start;
				e = end;
				createEvent();
				//var allDay = !start.hasTime() && !end.hasTime();
				//alert('Value of check box'+$('#check').is(":checked"));
				//alert('Value of Frequency'+$('#rfreq').val()); //numevent
				//alert('Repeat Unit '+$('#runit').val());
				//dialog.dialog( "open" );
				//var title = prompt('Event Title:');
				//var color = prompt('Event Colour:');
				//alert('Already here not waiting for function');
				//var title = eventName+'safe';
				//var color = eventColor;
				
			},
			/*eventRender: function(event, element) {
					$('#calendar').fullCalendar('removeEvents',event._id);
			},*/
			eventClick: function (calEvent, jsEvent, view) {
				//alert('Event Id: ' + calEvent.id);
				//alert('Event _Id: ' + calEvent._id);
				$('#calendar').fullCalendar('removeEvents',calEvent.id);
				/*$('#calendar').fullCalendar('removeEvents', function (calEvent) {
					return true;
				});*/
			},
			/*eventClick: function(calEvent, jsEvent, view, event) {

				//alert('Event: ' + calEvent.title);
				//alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
				//alert('View: ' + view.name);
				
				$('#calendar').fullCalendar('removeEvents',event._id);

				// change the border color just for fun
				//$(this).css('border-color', 'red');
				/*if (event.url) {
					window.open(event.url,"");
					//return false;
				}

			},*/
			events: [
						{
							id: 111,
							title: 'Google',
							color: 'red',
							//url: 'http://google.com/',
							start: '2017-09-12'
						},
						{
							id: 222,
							title: 'Meeting',
							start: '2017-09-14',
							repeats: 1
						},
						{
							id: 333,
							title: 'HourTest',
							start: '2017-09-13T10:30:00',
							end: '2017-09-13T12:30:00'
						},
						{
							id: 444,
							title: 'HourTest2',
							start: '2017-09-15T10:30:00',
							end: '2017-09-15T12:30:00'
						}
					]
		});
		
		/*$(function(){
			$('#btn').click(function() {
				//alert("Hello");
				$('#calendar').fullCalendar('next');
				//alert(calendar.moment());
			});
		});*/
		dialog = $( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 400,
			width: 350,
			modal: true,
			buttons: {
				"Create an Event": addUser,
				Cancel: function() {
				dialog.dialog( "close" );
				}
			},
			close: function() {
				form[ 0 ].reset();
				//allFields.removeClass( "ui-state-error" );
			}
		});
		
		form = dialog.find( "form" ).on( "submit", function( event ) {
			event.preventDefault();
			addUser();
		});
 
    /*$( "#btn" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });*/
	});
	
	/*$(document).ready(function() {
		$('#calendar').fullCalendar({
			googleCalendarApiKey: 'AIzaSyBdtaBRGtV2v4itUw8-a2OdVsdELgURKuI',
				events: {
					googleCalendarId: 'utkarshkv93@gmail.com'
				}
		});
	});*/

</script>
</head>

<body>
<!-- header section -->
<section class="banner" role="banner">
  <header id="header">
    <div class="header-content clearfix"><!--<a class="logo" href="index.html">Calendar</a>-->
      <nav class="navigation" role="navigation">
        <ul class="primary-nav">
          <!--<li><a href="#intro">About</a></li>-->
          <li><a href="#services">services</a></li>
          <!--<li><a href="#works">Works</a></li>
          <li><a href="#teams">Our Team</a></li>
          <li><a href="#testimonials">Testimonials</a></li>-->
          <li><a href="#contact">Contact</a></li>
        </ul>
      </nav>
      <a href="#" class="nav-toggle">Menu<span></span></a> </div>
  </header>
  <!-- banner text -->
  <div class="container">
    <div class="col-md-10 col-md-offset-1">
      <div class="banner-text text-center">
        <h1>Multipurpose Calendar</h1>
        <p>Introducing new way of maintaining events in a calendar. Now simply drag and drop events to reschedule and do much more.</p>
        <a href="#services" class="btn btn-large">Find out more</a> </div>
      <!-- banner text --> 
    </div>
  </div>
</section>
<!-- header section --> 
<!-- intro section -->
<section id="intro" class="section intro">
  <div class="container">
    <div class="col-md-8 col-md-offset-2 text-center">
      <h3>We've got what you need!</h3>
      <p>Introducing new way of maintaining events in a calendar. Now simply drag and drop events to reschedule and do much more!</p>
    </div>
  </div>
</section>
<!-- intro section --> 
<!-- services section -->
<section id="services" class="services service-section">
  <div id="calendar" class="ui-widget"></div>
</section>
<!-- services section -->
<div id="dialog-form" title="Create new Event">
	<p class="validateTips">All form fields are required.</p>
 
	<form>
		<fieldset>
			<label for="name">Name</label>
			<input type="text" name="ename" id="ename" value="Jane" class="text ui-widget-content ui-corner-all">
			<label for="ecolor">Color</label>
			<input type="text" name="ecolor" id="ecolor" value="red" class="text ui-widget-content ui-corner-all">
			<input type="checkbox" id="check">Repeat Events</input>
			<br/><br/>
			<input id="numevent">Number of events</input>
			<br/><br/>
			<label for="runit">Repeat Unit</label>
			<select id="runit">
				<option value="day">Day</option>
				<option value="month">Month</option>
				<option value="year">Year</option>
			</select>
			<br/><br/>
			<input id="rfreq">Repeat Frequency</input>
		</fieldset>
	</form>
 </div>

<!-- our team section -->
<section id="teams" class="section teams">
  <div class="container">
    <div class="row">
      <div class="col-md-3 col-sm-6">
        <div class="person"><img src="images/person.png" alt="" class="img-responsive">
          <div class="person-content">
            <h4>Utkarsh Vishwakarma</h4>
            <h5 class="role">The Team</h5>
            <p>Some Description</p>
          </div>
          <ul class="social-icons clearfix">
            <li><a href="#"><span class="fa fa-facebook"></span></a></li>
            <li><a href="#"><span class="fa fa-twitter"></span></a></li>
            <li><a href="#"><span class="fa fa-linkedin"></span></a></li>
            <li><a href="#"><span class="fa fa-google-plus"></span></a></li>
            <li><a href="#"><span class="fa fa-dribbble"></span></a></li>
          </ul>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="person"> <img src="images/person.png" alt="" class="img-responsive">
          <div class="person-content">
            <h4>Niraj Vishwakarma</h4>
            <h5 class="role">The Team</h5>
            <p>Some Description</p>
          </div>
          <ul class="social-icons clearfix">
            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
          </ul>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="person"> <img src="images/person.png" alt="" class="img-responsive">
          <div class="person-content">
            <h4>Kaustav Ray</h4>
            <h5 class="role">The Team</h5>
            <p>Some Description</p>
          </div>
          <ul class="social-icons clearfix">
            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
          </ul>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="person"> <img src="images/person.png" alt="" class="img-responsive">
          <div class="person-content">
            <h4>Ankit Shaw</h4>
            <h5 class="role">The Team</h5>
            <p>Some Description</p>
          </div>
          <ul class="social-icons clearfix">
            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- our team section --> 

<!-- contact section -->
<section id="contact" class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2 conForm">
        <h5>Shoot An Email</h5>
        <p>We are happy to talk you through any projects or run live demos for those wishing to see what it is to use our products and how they look like.</p>
        <div id="message"></div>
        <form method="post" action="php/contact.php" name="cform" id="cform">
          <input name="name" id="name" type="text" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Your name..." >
          <input name="email" id="email" type="email" class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 noMarr" placeholder="Email Address..." >
          <textarea name="comments" id="comments" cols="" rows="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" placeholder="Project Details..."></textarea>
          <input type="submit" id="submit" name="send" class="submitBnt" value="Send your query">
          <div id="simple-msg"></div>
        </form>
      </div>
    </div>
  </div>
</section>
<!-- contact section --> 

<!-- Footer section -->
<footer class="footer">
  <div class="footer-top section">
    <div class="container">
      <div class="row">
        <div class="footer-col col-md-6">
          <h5>Our Location</h5>
          <p>Bangalore, India</p>
          <p>Copyright © 2017 Utkarsh Vishwakarma. All Rights Reserved.</p>
        </div>
        <!--<div class="footer-col col-md-3">
          <h5>Services We Offer</h5>
          <p>
          <ul>
            <li><a href="#">Digital Strategy</a></li>
            <li><a href="#">Websites</a></li>
            <li><a href="#">Videography</a></li>
            <li><a href="#">Social Media</a></li>
            <li><a href="#">User Experience</a></li>
          </ul>
          </p>
        </div>-->
        <div class="footer-col col-md-3">
          <h5>Share with Love</h5>
          <ul class="footer-share">
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- footer top --> 
  
</footer>
<!-- Footer section --> 
<!-- JS FILES --> 
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.flexslider-min.js"></script> 
<script src="js/jquery.fancybox.pack.js"></script> 
<script src="js/retina.min.js"></script> 
<script src="js/modernizr.js"></script> 
<script src="js/main.js"></script> 
<script type="text/javascript" src="js/jquery.contact.js"></script>
</body>
</html>