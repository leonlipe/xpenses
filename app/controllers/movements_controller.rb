class MovementsController < ApplicationController
  protect_from_forgery except: :addmovement
  # GET /categories
  # GET /categories.json
  def index
   @fecha_actual = DateTime.current
   respond_to do |format|
        format.html
        format.json { render json: MovementsDatatable.new(view_context) }
    end    
  end



  def addmovement
  	puts params
  	datos = JSON.parse params["datos"]
  	puts datos
  	movement = Movement.new
  	movement.mov_date = Date.strptime(datos["fecha"], "%d-%m-%Y")
  	movement.amount = datos["cantidad"]
  	movement.description = datos["descripcion"]
  	movement.note = datos["notas"]
  	movement.account_id = datos["account_id"]
  	movement.kind = datos["movement_kind"]

  	movement.save!


  	render json: movement 


  end

  def import
    
    Movement.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end
end
