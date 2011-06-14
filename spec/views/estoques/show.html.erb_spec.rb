require 'spec_helper'

describe "estoques/show.html.erb" do
  before(:each) do
    @estoque = assign(:estoque, stub_model(Estoque))
  end

  it "renders attributes in <p>" do
    render
  end
end
