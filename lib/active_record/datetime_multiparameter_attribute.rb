module ActiveRecord
  # ActiveRecord (temporal) extension to handle 2-field datetime attribute assignment
  module DatetimeMultiparameterAttribute
    private

    def read_value_from_parameter(name, values_hash_from_param)
      klass = (self.class.reflect_on_aggregation(name.to_sym) || column_for_attribute(name)).klass
      if (klass == Time || klass == Datetime) && values_hash_from_param.size == 2
        t = Time.zone.parse("#{values_hash_from_param[1]} #{values_hash_from_param[2]}")
        if t
          values = {
            1 => t.year,
            2 => t.month,
            3 => t.day,
            4 => t.hour,
            5 => t.min,
            6 => t.sec,
            7 => t.usec
          }
          read_other_parameter_value(klass, name, values)
        else
          nil
        end
      else
        super
      end
    end
  end
end
