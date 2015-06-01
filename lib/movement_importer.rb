class MovementImporter < ActiveImporter::Base
    imports Movement

    column 'Numero de prestamo', :loan_number
    column 'Cantidad', :amount
    column 'Negocio', :business do |business|
       Business.find_by(name: business)

    end
    column 'Tipo', :period do |period|
       Period.find_by(meassure_unit: period)

    end
    column 'Fecha de Inicio', :date_started
    column 'Fecha de entrega del efectivo', :deliver_date
    column 'Entrega del efectivo al siguiente dia', :next_day do |next_day|
       if next_day == 'SI'
        true
       else
        false
       end
    end
    column 'Garantia de pago ', :warranty
    column 'Meses para pagar', :months_to_pay
    column 'Alias de Cliente', :client  do |client_alias|
       Client.where('alias = ?', client_alias).first
    end



    
    on :row_processing do
        #model.manual_generate_commitments
        model.status = 0
        model.grouped = false
    end


    on :import_failed do |ex|
     puts("Could not start importing data: #{ex}")
    end
    on :row_error do |ex|
     puts("Could not start importing data: #{ex}")
      #@rows_with_errors += 1
    end

    on :row_success do
        model.status = 1
        model.save!
     puts("Fila exitosa...")
       # @rows_imported += 1
      end

    on :row_processed do
     puts("Fila procesada...")
        #@rows_processed += 1
      end

end