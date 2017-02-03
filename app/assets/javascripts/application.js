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
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function() { //  http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper
  $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
  });

  /*infinite wall options*/
  var tile_options = {
    width: 400,
    height: 400,
    start_col: 0,
    start_row: 0,
    oncreate: function($element, col, row) {
      $('<div class="_content"></div>').
        appendTo($element).
        dblclick(function(e) {
          edit($(this));
        });
    }
  };
  jQuery.infinitedrag('#demo2_wall', {}, tile_options);
});

/*todo: different behaviour depending on if server or container. The created elements are sometimes stuck in position and cannot be moved. */
$(function(){
  $('.menu-item-draggable').draggable({
    cursor: 'move',
    containment: 'window',
    helper: function() {
    	return $(this).clone().appendTo('body');
    }
	});
	$('#demo2_viewport').droppable({
		tolerance: 'fit',
    drop: function(event, ui) {
    	if( $(ui.draggable).hasClass('menu-item-draggable')) {
      	var box = $("<div/>", { class: 'test', text: "container", id: 'server'}).draggable({
      		revert: false,
			    stop: function(){
			      $(this).draggable('option', 'revert', false);
		    	}
      	});
     	}   	
     	$('#demo2_wall').append(box);
    }
  });
});