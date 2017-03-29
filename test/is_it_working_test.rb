require 'test_helper'

class IsItWorkingTest < Minitest::Test

  def setup
  	IsItWorking.configure do |config|
	  config.testing = true
	end
  end

  def test_that_it_has_a_version_number
    refute_nil ::IsItWorking::VERSION
  end

  def test_raises_error_when_no_key
  	assert_raises RuntimeError do 
    	IsItWorking::Checkin.ping(message:"hello there")
  	end

    IsItWorking::Checkin.ping(key:"dummy_key",message:"hello there")

  end

  def test_url_is_correct
  	checkin = IsItWorking::Checkin.ping(key:"CHECKIN_IDENTIFIER",message:"hello there")
  	assert "https://api.IsItWorking.info/c/CHECKIN_IDENTIFIER".force_encoding('ASCII-8BIT'), checkin.uri.to_s
  end

  def test_timing_works
    checkin = IsItWorking::Checkin.time(key:"CHECKIN_IDENTIFIER",message:"timing",boundary:1000) do
    	sleep 1
    end

    assert_in_delta checkin.params[:t], 1000, 10, "t param should be about 1000"
    assert_equal checkin.params[:b], 1000, "boundary is 1000"
    assert_equal checkin.params[:m], "timing", "message is timing"

  end
end
