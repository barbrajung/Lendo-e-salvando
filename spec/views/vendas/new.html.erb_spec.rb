require 'spec_helper'

describe "vendas/new" do
  before(:each) do
    assign(:venda, stub_model(Venda,
      :purchaser_name => "MyString",
      :item_description => "MyString",
      :item_price => 1.5,
      :purchase_count => 1,
      :merchant_adress => "MyString",
      :merchant_name => "MyString"
    ).as_new_record)
  end

  it "renders new venda form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vendas_path, :method => "post" do
      assert_select "input#venda_purchaser_name", :name => "venda[purchaser_name]"
      assert_select "input#venda_item_description", :name => "venda[item_description]"
      assert_select "input#venda_item_price", :name => "venda[item_price]"
      assert_select "input#venda_purchase_count", :name => "venda[purchase_count]"
      assert_select "input#venda_merchant_adress", :name => "venda[merchant_adress]"
      assert_select "input#venda_merchant_name", :name => "venda[merchant_name]"
    end
  end
end
