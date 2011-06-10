class Venda

  include DataMapper::Resource
	
  property :id, Serial
  property :controle, String
  property :venda, Float
  property :custo, Float
  property :lucro, Float
  property :quantidade, Float
  property :data_geracao, DateTime
  property :nome_produto, String
  property :lucratividade_venda, Float

end
