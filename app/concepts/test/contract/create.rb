require "reform"
require "reform/form/dry"

module Test::Contract
  class Create < Reform::Form
    include Dry

    property :name
    property :age

    validation do
      required(:name).filled
      required(:age).filled(:int?, gt?: 0, lt?: 120)
    end
  end
end
