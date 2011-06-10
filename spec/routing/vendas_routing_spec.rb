require "spec_helper"

describe VendasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/vendas" }.should route_to(:controller => "vendas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vendas/new" }.should route_to(:controller => "vendas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/vendas/1" }.should route_to(:controller => "vendas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vendas/1/edit" }.should route_to(:controller => "vendas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vendas" }.should route_to(:controller => "vendas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/vendas/1" }.should route_to(:controller => "vendas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vendas/1" }.should route_to(:controller => "vendas", :action => "destroy", :id => "1")
    end

  end
end
