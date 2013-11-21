require 'test_helper'

class MeterTest < ActiveSupport::TestCase
  test "close meters" do
    far_cafe = Meter.create!(
      name:      "Far Meter",
      latitude:   40.000000,
      longitude: -77.000000
    )

    close_meter = Meter.create!(
      name:      "Close Meter",
      latitude:   39.010000,
      longitude: -75.990000
    )

    close_meters = Meter.close_to(39.000000, -76.000000).load

    assert_equal 1,          close_meters.size
    assert_equal close_meter, close_meters.first
  end
end
