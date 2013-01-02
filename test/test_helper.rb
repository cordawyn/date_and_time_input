require "minitest/autorun"

# "active_support" really shouldn't be here,
# but it's Formtastic's fault not to require ActiveSupport where needed
require "active_support"
require "active_model"
require "formtastic"

require "date_and_time_input"

# Stuff for testing
class Rails
  class << self
    def application
      # FIXME: so Rails leaked into non-Rails formtastic, after all
      Struct.new(:config).new(Struct.new(:cache_classes).new(false))
    end
  end
end

class Person
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :born

  def persisted?
    false
  end
end
