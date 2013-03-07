if defined?(::ActionView)
  require "action_view/helpers/date_and_time_helper"
end

if defined?(::ActiveRecord)
  require "active_record/datetime_multiparameter_attribute"
  ActiveRecord::Base.send :include, ActiveRecord::DatetimeMultiparameterAttribute
end
