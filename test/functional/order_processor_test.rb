require File.dirname(__FILE__) + '/../test_helper'
require 'activemessaging/test_helper'
require File.dirname(__FILE__) + '/../../app/processors/application_processor'

class OrderProcessorTest < Test::Unit::TestCase
  include ActiveMessaging::TestHelper
  
  def setup
    load File.dirname(__FILE__) + "/../../app/processors/order_processor.rb"
    @processor = OrderProcessor.new
  end
  
  def teardown
    @processor = nil
  end  

  def test_order_processor
    @processor.on_message('Your test message here!')
  end
end