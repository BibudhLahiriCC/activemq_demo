class HelloWorldProcessor < ApplicationProcessor

  subscribes_to :hello_world

  def on_message(message)
    logger.debug "HelloWorldProcessor received: " + message
  end
end