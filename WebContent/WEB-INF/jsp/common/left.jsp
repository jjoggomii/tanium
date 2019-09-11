<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/resources/css/fullcalendar.print.min.css' rel='stylesheet'	media='print' />
<script src='/resources/js/lib/moment.min.js'></script>
<script src='/resources/js/lib/jquery.min.js'></script>
<script src='/resources/js/fullcalendar.min.js'></script>

<script>
	$(document).ready(function() {
	 	$('#calendar').fullCalendar({
			
			events: function(start, end, timezone, callback) {
				$('.fc-button-group').css('float','right');
				var fcRight = $('.fc-right').clone();
				/*  $('.fc-right').remove();  */
				$('.fc-left').find('h2').css({'margin-left': '14px', 'font-size': '29px'})
				$('.fc-widget-header').css('margin-right','16px');
				/* $('.fc-scroller').css('overflow','hidden'); */
				$('.fc-toolbar').css('margin-top','11px');
				$('.fc-day-header').css('font-size','12px');
				$('.fc-right').css({'width': '227px', 'margin-right': '4px','margin-top': '15px'})
				
			}
		}); 

		/* fc-scroller fc-day-grid-container   overflow 지울거야       fc-toolbar */
		$("#mypage").click(function() {
			$("#leftForm").attr("action", "/mp/selectMp.tan");
			$("#leftForm").submit();
		});
	});
</script>
<style>
.listyle {
	font-size: 20px;
	text-align: center;
	color: #0A0A2A;
}


/* full calendar */

.fc-basic-view .fc-body .fc-row {
	min-height: 0px !important;
}
</style>

<div class="col-md-3 sidebar-offcanvas bg-light pl-0" id="sidebar"
	role="navigation"
	style="background-color: #D1DDDB !important; position: fixed; height: 100%; width: 266px;">
	<form id="leftForm" name="leftForm" method="post">
		<div style="width: 266px; height: 200px; margin-top: 87px;">
			<div id="userimg"
				style="background-color: #1D6A96; width: 40%; height: 70%; position: relative; top: 10px; left: 10px;">

			</div>
			<div
				style="background-color: #1D6A96; width: 44%; height: 70%; position: relative; top: -130px; left: 133px;">
			</div>
			<div style="margin-top: -120px; margin-left: 11px;">
				<input type="submit" id="mypage" value="My Page"
					style="background-color: #1D6A96; outline: auto; width: 238px; outline-color: #1D6A96;"
					class="btn btn-primary" />
			</div>
		</div>
	</form>
	<ul class="nav flex-column sticky-top pl-0 mt-3" id="ttleftbar"
		style="padding-top: 15px;">


	</ul>
	
	 <div id="calendar" style="margin-left: 12px; border: 1px solid cadetblue; " class="card mb-3" >
	</div> 
</div>

