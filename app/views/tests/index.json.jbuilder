json.array! @model do |test|
	json.extract! test, :id, :name, :age
end