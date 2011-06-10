require 'spec_helper'

describe "vendas/edit.html.erb" do
  before(:each) do
    @venda = assign(:venda, stub_model(Venda,
      :new_record? => false
    ))
  end

  it "renders the edit venda form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => venda_path(@venda), :method => "post" do
    end
  end
end
