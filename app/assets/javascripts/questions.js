$(document).ready(function() {
	$('#question_type').change(function () {
		if ($(this).val() === 'scale') {
			$('#scale_options').show();
		} else {
			$('#scale_options').hide();
		}
	});
});
