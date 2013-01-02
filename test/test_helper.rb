require "minitest/autorun"

# "active_support" really shouldn't be here,
# but it's Formtastic's fault not to require ActiveSupport where needed
require "active_support"
require "formtastic"

require "date_and_time_input"

# Stuff for testing
class Person
  attr_accessor :born

  class << self
    def model_name
      "person"
    end
  end
end
