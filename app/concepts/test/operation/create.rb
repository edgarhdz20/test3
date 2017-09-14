class Test::Create < Trailblazer::Operation
  step Policy::Guard( :authorize! )
  step :model!
  step Contract::Build( constant: Test::Contract::Create )
  step Contract::Validate( key: :test )
  step :persist!

  def authorize!(options, current_user:, **)
    current_user.signed_in?
  end

  def model!(options, **)
    options["model"] = Test.new(options["params"][:test].slice(:name, :age))
  end

  def persist!(options, params:, model:, **)
    model.save
  end
end

