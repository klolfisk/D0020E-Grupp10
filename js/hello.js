$(document).ready(function() {
		$.ajax({
				url: "http://rest-service.guides.spring.io/greeting"
		}).then(function(data) {
				$('.greeting-id').append(data.id);
				$('.greeting-name').append(data.name);
				$('.content').append(data);
		});
});
