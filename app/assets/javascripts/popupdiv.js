$(document).ready( function(){

var EventPopup = {
	setup: function(){

	//add hidden div to end of page to display popup:

		var popupDiv = $('<div id="eventInfo"></div>');
        	popupDiv.appendTo($('body')).hide();
		$(document).on('click', '.ec-event a', 	EventPopup.getEventInfo);
	},
	getEventInfo: function() {
		$.ajax({type: 'GET', url: $(this).attr('href'),
		timeout: 5000,
		success: EventPopup.showEventInfo,
		error: function(xhrObj, textStatus, exception)
			{alert('Error finding Event!');
			}
		});
		return(false);
	},
	
	showEventInfo: function(data, requestStatus, xhrObject){
		alert("Success");
		var oneFourth = Math.ceil($(window).width() / 4);
		$('#eventInfo').css({'left': oneFourth, 'width': 2*oneFourth, 'top': 250}).html(data).show();
var hideButton = $('<button id="hideInfo">Close</button>');
		hideButton.appendTo($('#eventInfo .body .mainform'));
	$('#hideInfo').click(EventPopup.hideEventInfo);
	}	

	,hideEventInfo: function() {
	$('#eventInfo').hide();
	return(false);

	}
};

EventPopup.setup();

});
