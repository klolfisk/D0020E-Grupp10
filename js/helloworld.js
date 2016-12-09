var xhr = new XMLHttpRequest({mozSystem: true});
$(document).ready(function() {
		$.ajax({
				//url: "http://127.0.0.1:2375/containers/json?all=1",
				//url: "http://localhost:2375/containers/json?all=1",
				url: "http://192.168.56.1:2375/containers/json?all=1",
				crossDomain:true,
				dataType: "json",
				type: "GET",
				success: function(data){
						console.log("now then?");
				}
		}).then(function(data) {
				console.log("shit is happening");
				console.log(data);
				$('.greeting-id').append("stuff" + data.id);
				$('.greeting-name').append(data.image);
				$('.content').append(data);
		}).after(function(){
				console.log("helloworld finished")
		});
});
