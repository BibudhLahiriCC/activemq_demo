require 'activemessaging/processor'

class SayHelloWorldController < ApplicationController
  include ActiveMessaging::MessageSender

  publishes_to :hello_world

  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def say_hello
    publish :hello_world, "<say>Hello World!</say>"
  end

end
