class Venda

  include DataMapper::Resource
	
#	storage_names[:default] = "vendas"
  property :id, Serial
	property :controle, String
	property :venda, Float
	property :custo, Float
	property :lucro, Float


end
