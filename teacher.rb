require_relative 'person'

class Teacher < Person
  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission, id: rand(1000..9999))
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
