require 'spec_helper'

describe "estoques/new.html.erb" do
  before(:each) do
    assign(:estoque, stub_model(Estoque).as_new_record)
  end

  it "renders new estoque form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => estoques_path, :method => "post" do
    end
  end
end
