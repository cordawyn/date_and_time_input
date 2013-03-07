require "test_helper"

describe ActionView::Helpers::DateAndTimeHelper do
  include ActionView::Helpers::DateAndTimeHelper

  describe "date_and_time_field" do
    subject { date_and_time_field(:object, :created_at) }

    it "must produce proper markup" do
      subject.must_equal "<input id=\"object_created_at_1\" name=\"object[created_at(1)]\" type=\"date\" /><input id=\"object_created_at_2\" name=\"object[created_at(2)]\" type=\"time\" />"
    end
  end
end
