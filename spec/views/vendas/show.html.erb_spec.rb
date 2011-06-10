require 'spec_helper'

describe "vendas/show.html.erb" do
  before(:each) do
    @venda = assign(:venda, stub_model(Venda))
  end

  it "renders attributes in <p>" do
    render
  end
end
