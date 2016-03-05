class BanksDatatable
    delegate :params, :h, :link_to, :number_to_currency, to: :@view

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Bank.count,
        iTotalDisplayRecords: banks.total_entries,
        aaData: data
      }
    end


    private

    def data
      banks.map do |bank|
        [
          bank.id,
          bank.bank_key,
          bank.description
        ]
      end
    end

    def banks
        @banks ||= fetch_banks
    end

    def fetch_banks
      
      banks = Bank.order("#{sort_column} #{sort_direction}")
      banks = banks.page(page).per_page(per_page)
      if params[:sSearch].present?
        banks = banks.where("description like :search or bank_key like :search", search: "%#{params[:sSearch]}%")
      end
      banks
    end

    def page
    params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
    columns = %w[description bank_key]
    columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end 


end