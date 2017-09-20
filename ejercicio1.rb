#Crear una clase Table cuyo constructor reciba el nombre de la mesa y las
#recaudaciones correspondientes de cada día.

class Table
	attr_accessor :name, :profit #(4 métodos de instancia : table, =table y profit, =profit)
	def initialize(name, *profit) # método de clase
		@name = name
		@profit = profit.map(& :to_i)
	end


#Crear un método que permita leer el archivo e instanciar una mesa por línea del
#archivo.

	def self.create_tables
		tables = []
		file = File.open('casino.txt', 'r')
		lines = file.readlines
		lines.each do |line|
			new_line = line.split (', ')
			tables << Table.new(new_line.shift, *new_line)
		end
		tables #si no se incluye, devuelve el line (último objeto que se iteró).
	end

#Conocer el mayor valor recaudado, y a que mesa y día corresponde.

	def self.max_profit #es lo mismo que decir Table.max_profit
		tables = self.create_tables
		#iterate over each table
		best_tables = {}
		tables.each_with_index do |table, day|
			best_tables[table.name] = [table.profit.max, day+1]
		end
		print best_tables.max_by{|k,v| v[0]}
	end

# Calcular el promedio total de lo recaudado por todas las mesas en todos los días.

	def self.profit_average
		tables = self.create_tables
		results = []
		tables.each do |table|
			results << table.profit
		end
		results.flatten!
		print results.inject(0){|sum, i| sum + i} / results.size
	end

end

#print Table.create_tables
Table.max_profit
puts '##################'
Table.profit_average