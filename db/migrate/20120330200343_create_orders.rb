class CreateOrders < ActiveRecord::Migration
  def change
    #This is the block form of create_table. create_table()
    #passes a TableDefinition object to the block. We are using
    #the block form with shorthand, which means using the
    #column types as method calls, rather than calling the
    #column method.
    create_table :orders do |t|
      t.column :customer, :string
      t.column :product, :string
      t.column :quantity, :int
      t.column :status, :string, :default => 'OPEN'
      t.timestamps
    end
  end
end
