class ChartController < ApplicationController
 def index
   todas_vendas = Venda.all
   @custos = Hash.new(0)
   @vendas = Hash.new(0)
   @lucros = Hash.new(0)
    todas_vendas.each do |v|
     data = v.data_geracao.to_s
     @custos[data] += v.custo
     @vendas[data] += v.venda
     @lucros[data] += v.lucro
   end
 end
end
