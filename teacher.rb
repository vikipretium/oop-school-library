# inherit from person
require './person'

class Teacher < Person
  # constructor specilization
  def initialize(age, specilization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specilization = specilization
  end

  # override can_use_services?
  def can_use_services?
    true
  end
end
