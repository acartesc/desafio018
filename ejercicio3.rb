
# Crear una clase llamada Roulette.
class Roulette
	#attr_accessor :number
	#def initialize (number)
	#	@number = number
	#end

# Crear un método de instancia llamado play que reciba como argumento un número
# al cual se está apostando. Luego debe tomar un valor -del array- al azar y
# compararlo con el número al cual se apostó.

	def play(number)
		sample = r = (1..10).to_a.sample
		print number == sample ? 'win' : 'lose'
	end

end

Roulette.new.play(6)