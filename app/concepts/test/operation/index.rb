class Test::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = ::Test.all.reverse_order
  end
end