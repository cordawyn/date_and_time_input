module Formtastic
  module DateAndTimeInput
    # @private
    class Engine < ::Rails::Engine
      initializer 'formtastic.date_and_time_input.initialize' do
        # TODO: modify ActiveRecord to handle our special multiattributes
      end
    end
  end
end
