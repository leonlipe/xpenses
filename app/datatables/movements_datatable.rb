class MovementsDatatable
    delegate :params, :h, :link_to, :number_to_currency, to: :@view

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Movement.count,
        iTotalDisplayRecords: movements.total_entries,
        aaData: data
      }
    end


    private

    def data
      movements.map do |movement|
        [
          movement.id,
          movement.mov_date,
          movement.amount    
        ]
      end
    end

    def movements
        @movements ||= fetch_movements
    end

    def fetch_movements
      
      movements = Movement.order("#{sort_column} #{sort_direction}")
      movements = movements.page(page).per_page(per_page)
      if params[:sSearch].present?
        movements = movements.where("amount like :search or mov_date like :search", search: "%#{params[:sSearch]}%")
      end
      movements
    end

    def page
    params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
    columns = %w[amount mov_date]
    columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end 


end