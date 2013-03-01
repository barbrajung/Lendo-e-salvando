require 'spec_helper'

describe "vendas/show" do
  before(:each) do
    @venda = assign(:venda, stub_model(Venda,
      :purchaser_name => "Purchaser Name",
      :item_description => "Item Description",
      :item_price => 1.5,
      :purchase_count => 1,
      :merchant_adress => "Merchant Adress",
      :merchant_name => "Merchant Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Purchaser Name/)
    rendered.should match(/Item Description/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/Merchant Adress/)
    rendered.should match(/Merchant Name/)
  end
end
