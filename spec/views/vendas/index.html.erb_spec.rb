require 'spec_helper'

describe "vendas/index" do
  before(:each) do
    assign(:vendas, [
      stub_model(Venda,
        :purchaser_name => "Purchaser Name",
        :item_description => "Item Description",
        :item_price => 1.5,
        :purchase_count => 1,
        :merchant_adress => "Merchant Adress",
        :merchant_name => "Merchant Name"
      ),
      stub_model(Venda,
        :purchaser_name => "Purchaser Name",
        :item_description => "Item Description",
        :item_price => 1.5,
        :purchase_count => 1,
        :merchant_adress => "Merchant Adress",
        :merchant_name => "Merchant Name"
      )
    ])
  end

  it "renders a list of vendas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Purchaser Name".to_s, :count => 2
    assert_select "tr>td", :text => "Item Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Merchant Adress".to_s, :count => 2
    assert_select "tr>td", :text => "Merchant Name".to_s, :count => 2
  end
end
