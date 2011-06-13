class ChartController < ApplicationController
 def index
   todas_vendas = Venda.all
   @chart = Hash.new(0)
    todas_vendas.each do |v|
     data = v.data_geracao
     @chart[data].nil? ? @chart[data] = Array.new(0) : 
     @chart[data][0] += v.custo
     @chart[data][1] += v.venda
     @chart[data][2] += v.lucro
   end
 end
end
