require "test_helper"

require "action_view"
require "formtastic/helpers/form_helper"

describe Formtastic::Inputs::DateAndTimeInput do
  include Formtastic::Helpers::FormHelper

  let(:person) { Person.new }

  it "is created" do
    semantic_form_for(person) { |f| f.input :born, as: :date_and_time_input }
  end
end
