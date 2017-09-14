class TestsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

	def index
		run Test::Index
	end

	def new
	end

	def create
    Test::Create.({test: {name: test_params[:name], age: test_params[:age]}}, current_user: User.new(true))
  end

  def test_params
  	params.require(:test).permit(:name, :age)
  end
end