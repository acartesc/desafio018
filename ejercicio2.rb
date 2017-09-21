require 'date'

class Course
	attr_accessor :name, :dates

# Crear una clase Course cuyo constructor reciba el nombre y las fechas de inicio y
# termino de cada curso.

	def initialize(name, dates)
		@name = name
		@dates = dates.map {|date| Date.parse(date)}
	end

# Crear un método que permita leer el archivo e instanciar una mesa por línea del
# archivo.

	def self.create_course
		courses = []
		file = File.open('cursos.txt', 'r')
		lines = file.readlines
		file.close
		lines.each do |line|
			new_line = line.split(', ')
			courses << Course.new(new_line.shift, new_line)
		end
		courses #no funciona si no se entrega esta
	end

# Saber qué cursos comienzan previo a una fecha entregada como
# argumento.

	def self.before_date(date)
		raise ArgumentError.new('date is past 2018-01-01') if date >= Date.new(2018,01,01)
		courses = create_course
		courses.each do |course|
			puts course.name if date >= course.dates[0]
		end
	end

# Saber qué cursos finalizan posterior a una fecha entregada como
# argumento.

	def self.after_date(date)
		raise ArgumentError.new('date is past 2018-01-01') if date >= Date.new(2018,01,01)
		courses = create_course
		courses.each do |course|
			puts course.name if date <= course.dates[0]
		end
	end

end

Course.before_date(Date.new(2017,05,15)) # Se hace con Date.today
puts '#################'
Course.after_date(Date.new(2017,05,15))