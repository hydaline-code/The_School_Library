class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    @id = rand(1000..9999)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
