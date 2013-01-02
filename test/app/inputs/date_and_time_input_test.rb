require "test_helper"

require "action_view"
require "formtastic/helpers/form_helper"

describe Formtastic::Inputs::DateAndTimeInput do
  include ActionView::Helpers::FormHelper
  include ActionController::RecordIdentifier
  include Formtastic::Helpers::FormHelper

  attr_accessor :output_buffer

  let(:person) { Person.new }

  it "is created" do
    semantic_form_for(person) { |f| f.input :born, as: :date_and_time }
  end

  private

  def people_path(params = {})
    params.each do |k, v|
      params.delete(k) unless params[k]
    end
    "/people" + (params.empty? ? "" : params.to_param)
  end
end
