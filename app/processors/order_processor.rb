require 'rexml/document'
#REXML is a pure Ruby XML processor.

class OrderProcessor < ApplicationProcessor

  subscribes_to :order

  def on_message(message)
    logger.info "OrderProcessor received: " + message
    doc = REXML::Document.new(message)
    #doc.root.elements.each do |element|
      #First element is id, second is customer, etc
      id = doc.root.elements["id"].text
      puts "Updating status of object with id = #{id}"

      @order = Order.find(id)
      @order.status = 'SHIPPED'
      @order.save
    #end
  end
end
