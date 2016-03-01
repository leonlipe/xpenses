# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
    oTable = $('#movements_datatable').dataTable
      
      bProcessing: true
      bJQueryUI: true
      sPaginationType: 'full_numbers'    
      bServerSide: true
      sAjaxSource: $('#states_datatable').data('source')
      columns: [null, null,null]
      #sDom: '<""l>t<"F"fp>'
      oLanguage: 
        sLengthMenu: "Ver _MENU_ Filas"
        sSearch: ""
        oPaginate: 
          sPrevious: ""
          sNext: ""       
              
    #$('.dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Buscar")
    #$('.dataTables_length select').addClass("m-wrap small")
    #$('.dataTables_length select').select2()