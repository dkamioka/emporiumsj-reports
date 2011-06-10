require 'spec_helper'

describe "vendas/new.html.erb" do
  before(:each) do
    assign(:venda, stub_model(Venda).as_new_record)
  end

  it "renders new venda form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => vendas_path, :method => "post" do
    end
  end
end
