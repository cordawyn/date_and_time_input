module ActionView
  module Helpers
    module DateAndTimeHelper
      def date_and_time_field(object_name, method, options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_date_and_time_field_tag(options)
      end
    end

    class InstanceTag
      def to_date_and_time_field_tag(options = {})
        # TODO: generate fields with name = "method(1)" and "method(2)"
        tag("input", options)
      end
    end

    class FormBuilder
      def date_and_time(method, options = {})
        @template.date_and_time_field(@object_name, method, options)
      end
    end
  end
end
