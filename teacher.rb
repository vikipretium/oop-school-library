# inherit from person
require './persons'

class Teacher < Person
  # constructor specilization
  def initialize(age, specialization, name = 'Unknown')
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  # override can_use_services?
  def can_use_services?
    true
  end
end
