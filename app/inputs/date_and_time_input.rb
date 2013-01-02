module Formtastic
  module Inputs
    class DateAndTimeInput < DatetimeInput
      def to_html
        raise NotImplementedError
      end
    end
  end
end
