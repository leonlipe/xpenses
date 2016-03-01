/**
 * Unicorn Admin Template
 * Version 2.0.1
 * Diablo9983 -> diablo9983@gmail.com
**/

$(document).ready(function(){
	
	// $('.data-table').dataTable({
	// 	"bJQueryUI": true,
	// 	"bProcessing": true,
	// 	"bServerSide": true,
	// 	"sAjaxSource": $('#states_datatable').data('source'),
 //        "columns": [null, null,null],
 //        "oLanguage":{ 
 //          "sLengthMenu": "Ver _MENU_ Filas",
 //          "sSearch": "",
 //          "oPaginate": {
 //            "sPrevious": "",
 //            "sNext": "" 
 //          }
 //        },
	// 	"sPaginationType": "full_numbers",
	// 	"sDom": '<""l>t<"F"fp>'
	// });


     
              

	
	var checkboxClass = 'icheckbox_flat-blue';
	var radioClass = 'iradio_flat-blue';
	$('input[type=checkbox],input[type=radio]').iCheck({
    	checkboxClass: checkboxClass,
    	radioClass: radioClass
	});
	
	$('select').select2();
	

	$("span.icon input:checkbox, th input:checkbox").on('ifChecked || ifUnchecked',function() {
		var checkedStatus = this.checked;
		var checkbox = $(this).parents('.widget-box').find('tr td:first-child input:checkbox');		
		checkbox.each(function() {
			this.checked = checkedStatus;
			if (checkedStatus == this.checked) {
				$(this).closest('.' + checkboxClass).removeClass('checked');
			}
			if (this.checked) {
				$(this).closest('.' + checkboxClass).addClass('checked');
			}
		});
	});	
});
