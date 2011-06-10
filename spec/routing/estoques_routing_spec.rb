require "spec_helper"

describe EstoquesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/estoques" }.should route_to(:controller => "estoques", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/estoques/new" }.should route_to(:controller => "estoques", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/estoques/1" }.should route_to(:controller => "estoques", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/estoques/1/edit" }.should route_to(:controller => "estoques", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/estoques" }.should route_to(:controller => "estoques", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/estoques/1" }.should route_to(:controller => "estoques", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/estoques/1" }.should route_to(:controller => "estoques", :action => "destroy", :id => "1")
    end

  end
end
