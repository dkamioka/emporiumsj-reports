require 'spec_helper'

describe "estoques/edit.html.erb" do
  before(:each) do
    @estoque = assign(:estoque, stub_model(Estoque,
      :new_record? => false
    ))
  end

  it "renders the edit estoque form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => estoque_path(@estoque), :method => "post" do
    end
  end
end
