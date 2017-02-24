// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

var containerId = 0; // borde ta något mer vettigt kanske 
var selectedServer = "";

$(document).on('turbolinks:load', function() { //  http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper
	$('[data-toggle=offcanvas]').click(function() {
		$('.row-offcanvas').toggleClass('active');
	});

	$(function(){
	  $('.menu-item').draggable({
	    cursor: 'move',
	    containment: 'window',
	    helper: function() {
	    	return $(this).clone().appendTo('body');
	    }
		});
		$('.server').droppable({
			hoverClass: "drop-hover",
	    drop: function(event, ui) {
	    	if( $(ui.draggable).hasClass('newContainer')) {
	      	//var box = $("<div/>", { class: 'containerBox', text: "container", id: 'container-'+containerId++});
	      	selectedServer = $(this).attr('data-server-id');
	     		$('#newContainerModal').modal('show');
	     	}   

	     		
	     	//$(this).append(box); // gör inte så här utan ladda från databasen istället vid en uppdatering osv.
	    }
	  });
	});

	$('#newContainerModal').on('show.bs.modal', function(e) {
    $(this).find('select[name="container[server_id]"]').val(selectedServer);
    selectedServer = "";
	});

});

