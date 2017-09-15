class TestsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

	def index
		run Test::Index
	end

	def new
	end

	def create
    result = Test::Create.(test_params, current_user: User.new(true))
    if result.success?
    	render json: result["model"]
    else
    	render json: {message: "Ocurrio un error al crear"}, status: "500"
    end
  end

  def show
	  run Test::Show
	end

  def test_params
  	params.permit(:test => [:name, :age])
  end
end