class Course
	attr_accessor :name, :start, :end
	def initialize(name, start, end)
		@name = name
		@start = start
		@end = end
	end

	def self.create_course
		courses = []
		file = File.open('cursos.txt', 'r')
		lines = file.readlines
		print lines
	end
end

Course.create_course