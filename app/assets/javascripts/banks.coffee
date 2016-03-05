# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    oTable = $('#banks_datatable').DataTable

      responsive: true
      bJQueryUI: true
      bProcessing: true
      sPaginationType: 'full_numbers'
      bServerSide: true
      sAjaxSource: $('#banks_datatable').data('source')
      columns: [null, null]      
      oLanguage: 
        sLengthMenu: "Ver _MENU_ Filas"
        sSearch: ""
        oPaginate: 
          sPrevious: ""
          sNext: ""   

        