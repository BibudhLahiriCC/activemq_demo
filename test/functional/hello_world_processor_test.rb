require File.dirname(__FILE__) + '/../test_helper'
require 'activemessaging/test_helper'
require File.dirname(__FILE__) + '/../../app/processors/application_processor'

class HelloWorldProcessorTest < Test::Unit::TestCase
  include ActiveMessaging::TestHelper
  
  def setup
    load File.dirname(__FILE__) + "/../../app/processors/hello_world_processor.rb"
    @processor = HelloWorldProcessor.new
  end
  
  def teardown
    @processor = nil
  end  

  def test_hello_world_processor
    @processor.on_message('Your test message here!')
  end
end