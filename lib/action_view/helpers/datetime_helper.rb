module ActionView
  module Helpers
    module DateTimeHelper
      def datetime_field(object_name, method, options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_input_field_tag("date", options) +
          InstanceTag.new(object_name, method, self, options.delete(:object)).to_input_field_tag("time", options)
      end
    end

    # class InstanceTag
    # end

    class FormBuilder
      def datetime(method, options = {})
        @template.datetime_field(@object_name, method, options)
      end
    end
  end
end
