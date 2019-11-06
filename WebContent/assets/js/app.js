$(function(){
	$('#file-input4').on('change', function(){
		var file = this.file[0];
		var reader = new FileReader();
		reader.onload = viewer.load();
		reader.readAsDataURL(file);
		viewer.setProperties(file);
	});
	var viewer ={
			load: function(e){
				$('#preview').attr('src', e.target.result);
			},
			
		}
	});