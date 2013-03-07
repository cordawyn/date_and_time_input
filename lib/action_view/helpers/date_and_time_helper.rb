module ActionView
  module Helpers
    module DateAndTimeHelper
      DEFAULT_PREFIX = 'date'.freeze
      POSITION = { :date => 1, :time => 2 }.freeze

      def date_and_time_field(object_name, method, options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_date_and_time_field_tag(options)
      end
    end

    class InstanceTag
      def to_date_and_time_field_tag(options = {})
        # TODO: generate fields with name = "method(1)" and "method(2)"
        tag("input", options)
      end

      private

      # Returns the name attribute for the input tag.
      #  => post[written_on(1i)]
      def input_name_from_type(type)
        prefix = @options[:prefix] || ActionView::Helpers::DateAndTimeHelper::DEFAULT_PREFIX
        prefix += "[#{@options[:index]}]" if @options.has_key?(:index)

        field_name = @options[:field_name] || type
        if @options[:include_position]
          field_name += "(#{ActionView::Helpers::DateAndTimeHelper::POSITION[type]})"
        end

        @options[:discard_type] ? prefix : "#{prefix}[#{field_name}]"
      end

      # Returns the id attribute for the input tag.
      #  => "post_written_on_1i"
      def input_id_from_type(type)
        id = input_name_from_type(type).gsub(/([\[\(])|(\]\[)/, '_').gsub(/[\]\)]/, '')
        id = @options[:namespace] + '_' + id if @options[:namespace]

        id
      end
    end

    class FormBuilder
      def date_and_time(method, options = {})
        @template.date_and_time_field(@object_name, method, options)
      end
    end
  end
end
