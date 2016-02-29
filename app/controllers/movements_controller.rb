class MovementsController < ApplicationController

  # GET /categories
  # GET /categories.json
  def index
   respond_to do |format|
        format.html
        format.json { render json: MovementsDatatable.new(view_context) }
    end    
  end
end
