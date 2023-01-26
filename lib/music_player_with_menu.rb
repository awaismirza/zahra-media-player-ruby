require './input_functions'

# It is suggested that you put together code from your 
# previous tasks to start this. eg:
# TT3.2 Simple Menu Task
# TT5.1 Music Records
# TT5.2 Track File Handling
# TT6.1 Album file handling


require './input_functions'

$genre_names = ['Pop', 'Classic', 'Jazz', 'Rock']

class Album
  attr_accessor :title, :artist, :genre, :tracks
  def initialize(t, a, g)
    @title = title
    @artist = artist
    @genre = genre
    @tracks = tracks
  end
end

# This function Reads in and returns a single album from the given file, with all its tracks.
# ...for now however, take input from the terminal to enter just the album information.
# Complete the missing lines of code and change the functionality so that the hardcoded 
# values are not used.

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

def finished
    return true
end