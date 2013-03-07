module ActionView
  module Helpers
    module DateAndTimeHelper
      DEFAULT_PREFIX = 'date'.freeze
      POSITION = { :date => 1, :time => 2 }.freeze

      def date_and_time_field(object_name, method, options = {}, html_options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_date_and_time_field_tag(options, html_options)
      end
    end

    class InstanceTag
      def to_date_and_time_field_tag(options = {}, html_options = {})
        options = options.stringify_keys
        html_options = html_options.stringify_keys
        html_options["value"] = html_options.fetch("value"){ value_before_type_cast(object) }
        html_options["value"] &&= ERB::Util.html_escape(html_options["value"])
        { date: value_to_date(html_options["value"]),
          time: value_to_time(html_options["value"])
        }.inject("") do |output, (field_type, value)|
          html_options.merge!("id" => input_id_from_type(field_type, options),
                              "name" => input_name_from_type(field_type, options),
                              "type" => field_type,
                              "value" => value)
          output << tag("input", html_options)
        end
      end

      private

      def value_to_date(value)
        value && value.to_date.to_s
      end

      def value_to_time(value)
        value && value.strftime("%H:%M")
      end

      # Returns the name attribute for the input tag.
      #  => post[written_on(1)]
      def input_name_from_type(type, options = {})
        prefix = options["prefix"] || ActionView::Helpers::DateAndTimeHelper::DEFAULT_PREFIX
        prefix += "[#{options['index']}]" if options.has_key?("index")

        field_name = options["field_name"] || type
        if options["include_position"]
          field_name += "(#{ActionView::Helpers::DateAndTimeHelper::POSITION[type]})"
        end

        options["discard_type"] ? prefix : "#{prefix}[#{field_name}]"
      end

      # Returns the id attribute for the input tag.
      #  => "post_written_on_1"
      def input_id_from_type(type, options = {})
        id = input_name_from_type(type).gsub(/([\[\(])|(\]\[)/, '_').gsub(/[\]\)]/, '')
        id = options["namespace"] + '_' + id if options["namespace"]

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
