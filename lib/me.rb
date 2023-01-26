require './input_functions'
# It is suggested that you put together code from your 
# previous tasks to start this. eg:

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

# Maybe the following needs to be changed? How?
$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']


class Album
    attr_accessor :title, :artist, :genre
 # Returns an array of tracks read from the given file
    def initialize (title, artist, genre)
      #?,tracks)

        @genre = genre
        @title = title
        @artist = artist
        # @tracks = tracks
    end
end

class Track
  attr_accessor :name, :location

  def initialize (name, location)
    @name = name
    @location = location
  end
end

# TT3.2 Simple Menu Task

# a stub for Main Menu Option 2: Play existing Album
def Read_in_albums()
  # music_file = File.new("album.txt", "r")
  
end

def Display_albums(music_file)
  begin
    puts ("Display Album")
    puts('Enter 1 to show all Albums')
    puts('Enter 2 to show by genre')
    puts('Enter 3 to exit to main menu')
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    case choice
    when 1
      albums = read_albums_by_file(music_file)
      print_albums(albums)
    when 2
        albums_by_genre()
    when 3
      finished = true
    else
      puts "Please enter a value between 1 and 3"
    end
  end until finished
end

def Select_an_album_to_play
  puts ("You selected Select an Album to play. Press enter to continue")
  gets()
end
def Update_an_existing_album
  puts ("You selected Update an existing Album. Press enter to continue")
  gets()
end

# TT5.1 Music Records

# This function Reads in and returns a single album from the given file, with all its tracks.
# ...for now however, take input from the terminal to enter just the album information.
# Complete the missing lines of code and change the functionality so that the hardcoded 
# values are not used.

def read_album_by_name()

  # You could use get_integer_range below to get a genre.
  # You only the need validation if reading from the terminal
  # (i.e when using a file later, you can assume the data in
  # the file is correct)

  # insert lines here - use read_integer_in_range to get a genre
  puts("Enter Album")
  album_title = read_string("Enter album name:")
  album_artist = read_string("Enter artist name:")
  album_genre = read_integer_in_range("Enter Genre between 1 - 4: ", 1, 4)
  album = Album.new(album_title, album_artist, album_genre)
  album.title = album_title
  album.artist = album_artist
  album.genre = album_genre
  return album
end

# Takes a single album and prints it to the terminal 
# complete the missing lines:

#def print_album(album)
  #puts('Album information is: ')
	# insert lines here
	#puts('Genre is ' + album.genre.to_s)
	#puts($genre_names[album.genre])
#end

# def print_album(album)
#   puts('Album information is: ')
# 	# insert lines here
#   puts(album.title)
#   puts(album.artist)
# 	puts('Genre is ' + album.genre.to_s)
# 	puts($genre_names[album.genre])
# end

# Reads in an Album then prints it to the terminal


# TT5.2 Track File Handling



  # Reads in and returns a single album from the given file, with all its tracks
def read_albums_by_file(music_file)
  
  total_album_count = music_file.gets.to_i
	print("album count",total_album_count)
	# count = 7
  album_arr = Array.new()

  # Put a while loop here which increments an index to read the tracks
  	# track = File.open('album.txt')
	# if (!music_file || music_file.nil?)
	# 	print("2")
	# end
    i = 0
    while (i < total_album_count)
        album = read_album(music_file)
        # print(album.title, album.artist, album.genre)
        album_arr << album
        i = i+1
    end
	return album_arr
end


def read_album(music_file)

  # read in all the Album's fields/attributes including all the tracks
  # complete the missing code
    artist = music_file.gets()
    title = music_file.gets()
    genre = music_file.gets()
	  album = Album.new(title, artist, genre)
	return album
end

def print_album(album,id)
  # print out all the albums fields/attributes except tracks
  	puts("ALBUM ID: " + id.to_s.chomp)
    puts(album.title + " by " + album.artist)
	puts('Genre is ' + $genre_names[album.genre] )
	
end
def print_albums(albums)
	option = read_integer_in_range("1 - Display all \n2 - Display genre",1,2)
	if option == 1 then
	  i = 0
	  while i < albums.length do
		print_album(albums[i],i+1)
		i += 1
	  end
	elsif option == 2 then
		genre = read_integer_in_range("Select Genre \n1 - Pop\n2 - Classic\n3 - Jazz\n4 - Rock ",1,4)
		i = 0
		while i < albums.length do
			if albums[i].genre == genre then 
				print_album(albums[i],i+1)
			end 
			i += 1
		end
	end

end

def print_albums_12(albums)
  if (!albums)
      puts "No album has been read"
  else
          puts ""
          count = albums.length
          index = 0

          while (index < count)
              puts "The following are the details of the album #{index + 1}"
              print_album(albums[index])
              index += 1
      end
  end
  read_string("Press enter to continue...")
end

# Takes a single album and prints it to the terminal along with all its tracks
def print_album_23(album)

  # print out all the albums fields/attributes
  # Complete the missing code.
    puts album.artist.to_s
    puts album.title.to_s
    puts('Genre is ' + album.genre.to_s)
	  # puts($genre_names[album.genre])

    #puts('Genre is ' + album.genre.to_s)
	# puts($genre_names[album.genre])
    # print_tracks(album.tracks)
	# print out the tracks

end

  def get_track music_file
      track_name = music_file.gets()
      track_location = music_file.gets()
      Track.new(track_name, track_location)
  end
  
  def get_tracks music_file
      tracks = Array.new()
      count = music_file.gets().to_i
      index = 0
      while index < count
          track = get_track(music_file)
          tracks << track
          index += 1
      end
      tracks
  end
  
  def print_tracks tracks
      index = 0
      times = tracks.length
      while (index < times)
      puts tracks[index].name
      puts tracks[index].location
      index += 1
      end
  end    
      

# Reads in and returns a single track from the given file

def read_track(music_file)
	# fill in the missing code
	name = music_file.gets()
	location = music_file.gets()
    print(name,location)
	track = Track.new(name, location)
	return track
end

# Returns an array of tracks read from the given file

def read_tracks(music_file)
	
	count = music_file.gets().to_i()
	# print(count)
	# count = 7
  	tracks = Array.new()

  # Put a while loop here which increments an index to read the tracks
  	# track = File.open('album.txt')
	# if (!music_file || music_file.nil?)
	# 	print("2")
	# end
	i = 0
	while (i < count)
			track = read_track(music_file)
			tracks << track
			i = i+1
	end
	# if (!tracks || tracks.nil?)
	# 	print("3")
	# end
	return tracks
end

# Takes an array of tracks and prints them to the terminal

def print_tracks(tracks)
	# print all the tracks use: tracks[x] to access each track.
end

# Takes a single track and prints it to the terminal
def print_track(track)
  	puts('Track title is: ' + track.title)
	puts('Track file location is: ' + track.file_location)
end


# search for track by name.
# Returns the index of the track or -1 if not found
def search_for_track_name(tracks, search_string)

  matching_index = -1
  i = 0
    while (i < tracks.length)
      # print("Name ",tracks[i].name)
      if (tracks[i].name.chomp == search_string.chomp)
          matching_index = i
      end
      i += 1
    end
  #	found_index
    return matching_index
end


# Reads in an Album from a file and then prints all the album
# to the terminal


# def main()

#   	music_file = File.new("album.txt", "r")
#     tracks = read_tracks(music_file)
#   	music_file.close()

#   	search_string = read_string("Enter the track name you wish to find: ")
#  	index = search_for_track_name(tracks, search_string)
#   	if index > -1
#    		puts "Found " + tracks[index].name + "at " + index.to_s()
#   	else
#     	puts "Entry not Found"
#   	end
# end

# main()

# complete the case statement below and
# add a stub like the one above for option 2
# of this main menu
def main()
  finished = false
  begin
    puts('Main Menu:')
    puts('1 Read in Albums')
    puts('2 Display Albums')
    puts('3 Select an Album to play')
    puts('4 Update an existing Album')  
    puts('5 Exit')
    choice = read_integer_in_range("Please enter your choice:", 1, 5)
    case choice
    when 1
      puts("You selected Read in Albums")
      file_name = read_string("Please enter the file name which contains all the albums information:")
      music_file = File.new(file_name, "r")
    when 2
        Display_albums(music_file)
    when 3
        Select_an_album_to_play()
    when 4
        Update_an_existing_album()
    when 5
      finished = true
    else
      puts "Please select again"
    end
  end until finished
end
	
main()