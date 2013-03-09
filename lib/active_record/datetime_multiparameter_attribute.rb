module ActiveRecord
  # ActiveRecord (temporal) extension to handle 2-field datetime attribute assignment
  module DatetimeMultiparameterAttribute
    private

    def read_time_parameter_value(name, values_hash_from_param)
      if values_hash_from_param.size == 2
        t = Time.zone.parse("#{values_hash_from_param[1]} #{values_hash_from_param[2]}")
        if t
          values = [t.year, t.month, t.day, t.hour, t.min, t.sec, t.usec]
          instantiate_time_object(name, values)
        else
          nil
        end
      else
        super
      end
    end
  end
end
