require 'activemessaging/processor'

class OrdersController < ApplicationController
  include ActiveMessaging::MessageSender

  publishes_to :order

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

=begin
    respond_to is passed a block of code, which is converted to a
    Proc by &. Proc objects are blocks of code that have been bound
    to a set of local variables. They are also known as function objects
    or functors. Inside the respond_to method,
    we end up with a Proc that takes one argument.
    When we call the Proc from inside respond_to, we pass in, as an argument,
    an instance of the Responder class.

    def respond_to(&block)
      responder = Responder.new(self)
      #responder now becomes a parameter to the Proc
      block.call(responder)
      responder.respond
    end

    The respond method in ActionController::Responder
    is defined as follows.

    def respond
      method = "to_#{format}"
      #First we try to render a template, if the template is not available,
      #we verify if the resource responds to :to_format and display it.
      respond_to?(method) ? send(method) : to_format
    end

    So we end up calling .html and .xml on an instance of the responder class
    as it is passed into the block (that’s been converted to a Proc) inside the
    respond_to method. Rails determines the desired response format from the
    HTTP Accept header submitted by the client. The default format is HTML,
    for XML or JSON, it has to be specified through the address bar of the
    browser.
=end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
    if @order.save
=begin
         flash[:notice] when redirecting, flash.now[:notice] when rendering.
=end
      flash[:notice] = 'Order has been submitted'
      #to_xml builds an XML document to represent the model.
      publish :order, @order.to_xml
      #Using the Post/Redirect/Get (PRG) design pattern here
      format.html { redirect_to @order }
    else
      format.html { render action: "new" }
    end
   end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
end
