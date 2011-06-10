require 'spec_helper'

describe "estoques/index.html.erb" do
  before(:each) do
    assign(:estoques, [
      stub_model(Estoque),
      stub_model(Estoque)
    ])
  end

  it "renders a list of estoques" do
    render
  end
end
