require 'spec_helper'

describe "vendas/index.html.erb" do
  before(:each) do
    assign(:vendas, [
      stub_model(Venda),
      stub_model(Venda)
    ])
  end

  it "renders a list of vendas" do
    render
  end
end
