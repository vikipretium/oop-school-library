# inherit from person
require './person'

class Teacher < Person
  # constructor specilization
  def initialize(age, specialization, name = 'Unknown')
    super(age, name, true)
    @specialization = specialization
  end

  # override can_use_services?
  def can_use_services?
    true
  end
end
