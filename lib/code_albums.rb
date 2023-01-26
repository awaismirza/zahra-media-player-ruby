# require '../lib/input_functions'
# It is suggested that you put together code from your
# previous tasks to start this. eg:

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

# Function imported fro input functions
# Display the prompt and return the read string
def read_string prompt
  puts prompt
  value = gets.chomp
end

# Display the prompt and return the read float
def read_float prompt
  value = read_string(prompt)
  value.to_f
end

# Display the prompt and return the read integer
def read_integer prompt
  value = read_string(prompt)
  value.to_i
end

# Read an integer between min and max, prompting with the string provided

def read_integer_in_range(prompt, min, max)
  value = read_integer(prompt)
  while (value < min or value > max)
    puts "Please enter a value between " + min.to_s + " and " + max.to_s + ": "
    value = read_integer(prompt);
  end
  value
end

# Display the prompt and return the read Boolean

def read_boolean prompt
  value = read_string(prompt)
  case value
  when 'y', 'yes', 'Yes', 'YES'
    true
  else
    false
  end
end

# Test the functions above
=begin
def main
	puts "String entered is: " + read_string("Enter a String: ")
	puts "Boolean is: " + read_boolean("Enter yes or no:").to_s
	puts "Float is: " + read_float("Enter a floating point number: ").to_s
	puts "Integer is: " + read_integer_in_range("Enter an integer between 3 and 6: ", 3, 6).to_s
end

main
=end

# ---------------------------------------------------------------------------------------------------------------




# Maybe the following needs to be changed? How?
$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
  attr_accessor :id ,:title, :artist, :genre, :track
# Returns an array of tracks read from the given file
  def initialize (id, title, artist, genre, track)
      @id = id
      @genre = genre
      @title = title
      @artist = artist
      @track = track
  end
end

class Track
  attr_accessor :id, :name, :location

  def initialize (id, name, location)

    @id
    @name = name
    @location = location
  end
end


def read_albums_by_file(music_file)
  
  total_album_count = music_file.gets.to_i
	# print("album count",total_album_count)
	# count = 7
  album_arr = Array.new()

  # Put a while loop here which increments an index to read the tracks
  	# track = File.open('album.txt')
	# if (!music_file || music_file.nil?)
	# 	print("2")
	# end
    album_index = 0
    album_arr = Array.new()
    while (album_index < total_album_count)
        album = read_album(music_file, album_index)
        album_arr << album
        album_index = album_index + 1
    end
	return album_arr
end


def read_album(music_file, album_index)

  # read in all the Album's fields/attributes including all the tracks
  # complete the missing code
  artist = music_file.gets()
  title = music_file.gets()
  genre = music_file.gets()
  # album_track_count = music_file.gets().to_i
  tracks = read_tracks(music_file)
	album = Album.new(album_index, title, artist, genre, tracks)
	return album

end

def print_album(album,index)
  # print out all the albums fields/attributes except tracks
    # album_id = id.to_s.chomp
  	puts("ALBUM ID: " + (album[index].id).to_s)
    puts(album[index].title)
    puts(album[index].artist)
	  puts('Genre is ' + album[index].genre + 'which is '+ $genre_names[album[index].genre.to_i])
end

def print_albums(albums)
  if (!albums)
      puts "No album has been read"
  else
          puts ""
          count = albums.length
          index = 0
          while (index < count)
              puts "The following are the details of the album #{index + 1}"
              print_album(albums, index)
              index += 1
      end
  end
  main_menu()
  # read_string("Press enter to continue...")
end

#choice 1
def Read_music_file()
  file_name = read_string("Please enter the file name which contains all the albums information:")
  music_file = File.new(file_name, "r")
  albums = read_albums_by_file(music_file)
  return albums
end

#choice 2
def Display_albums(albums)
  begin
    puts("Display Album")
    puts('Enter 1 to show all Albums')
    puts('Enter 2 to show by genre')
    puts('Enter 3 to exit to main menu')
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    case choice
    when 1
      # albums = read_albums_by_file(music_file)
      print_albums(albums)
      # return albums
    when 2
      read_genre_by_number()
      # read_genre_by_number()  
      # albums_by_genre()
    when 3
      finished = true
    else
      puts "Please enter a value between 1 and 3"
    end
  end until finished
end

#choice 3
def play_tracks(albums)
     puts("Play by ID")
     count = albums.length
     play_id = read_integer_in_range("Select an Album ID to play",1,count)-1  
     print_tracks_with_id(albums, play_id)
     if(albums[play_id].tracks.length!=0)
      track_count = read_integer_in_range("Track number: ",1,albums[play_id].tracks.length)-1  
      selected_track = albums[play_id].tracks[track_count].name     
      puts("Playing #{selected_track}")  
      puts "From Album : " + albums[play_id].name     
      # puts("~~~~~~~~~~~~~~~")  
      # puts ""  sleep(5)   
    else     
      puts("There are no tracks to be played!")   
    end
  end

def play_album1()
  play_exit = 0
  begin
    choice = 0
    count = 0
    puts "Play Album:"
    puts "1 - Return to Menu"
    while count < @tracks.length
      print count + 2
      print " - "
      puts @tracks[count]
      count = count + 1
    end
    choice = read_integer_in_range("Option:", 1 ,@tracks.length + 1)
    system("clear") || system("cls")
    case
    when choice == 1
      play_exit = 1
    when choice > 1
      puts "Now Playing:"
      puts @tracks[(choice - 2)]
      puts "Press enter to end"
      gets()
    end
  end until play_exit == 1
end

def update_album1()
  update_exit = 0
  begin
    choice = 0
    puts "Update Album:"
    puts "1 - Update Album Artist"
    puts "2 - Update Album Title"
    puts "3 - Update Album Genre"
    puts "4 - Update Album Tracks"
    puts "5 - Return to Menu (Saves Changes)"
    choice = read_integer_in_range("Option:", 1, 5)
    system("clear") || system("cls")
    case choice
    when 1
      @album_artist = read_string("Enter new Album Artist:")
    when 2
      @album_title = read_string("Enter new Album Title:")
    when 3
      @album_genre = read_integer_in_range("Enter new Album Genre (1 - 4):", 1, 4)
    when 4
      update_album_tracks()
    when 5
      album_file = File.new(@album_name, "w")
      album_file.puts(@album_artist)
      album_file.puts(@album_title)
      album_file.puts(@album_genre)
      album_file.puts(@tracks.length)
      album_file.puts(@tracks)
      album_file.close()
      update_exit = 1
    end
  end until update_exit == 1
end

def update_album_tracks1()
  update_tracks_exit = 0
  begin
    choice = 0
    count = 0
    puts "Update Album Tracks:"
    puts "1 - Return to Menu (Saves Changes)"
    while count < @tracks.length
      print (count + 2)
      print " - Update "
      puts @tracks[count]
      count = count + 1
    end
    choice = read_integer_in_range("Option:", 1, @tracks.length)
    system("clear") || system("cls")
    case choice
    when choice == 1
      album_file = File.new(@album_name, "w")
      album_file.puts(@album_artist)
      album_file.puts(@album_title)
      album_file.puts(@album_genre)
      album_file.puts(@tracks.length)
      album_file.puts(@tracks)
      album_file.close()
      update_tracks_exit = 1
    when choice > 1
      @tracks[(choice - 2)] = read_string("Enter new Track Name:")
    end
  end until update_tracks_exit == 1
end

def print_tracks_with_id(albums, play_id)
  track_index = 0
  track_no = albums[play_id].track.length
  puts("Track List:")
  while(track_index<track_no)
    puts((track_index + 1).to_s + ". " + albums[play_id].tracks[track_index].name)
    track_index+=1
  end
end

def Select_an_album_to_play
  play_tracks(albums)
  puts ("You selected Select an Album to play. Press enter to continue")
  
end
def Update_an_existing_album
  puts ("You selected Update an existing Album. Press enter to continue")
  gets()
end

def read_tracks_by_number()
	tracks = Array.new()
	count = read_integer_in_range("Enter track count (Between 1-15): ", 0, 15)
	i = 0
	while (i < count)
			track = read_track
			tracks << track
			i += 1
		end
	return tracks
end

def read_genre_by_number()
  puts ''
  i = 0
   while (i < $genre_names.length)
      puts i.to_s + ":  " + $genre_names[i]
      i += 1
    end
    genre = read_integer_in_range('Please select a genre: ', 0, 3)
    return genre
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



# TT5.2 Track File Handling

  # Reads in and returns a single album from the given file, with all its tracks


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

def read_track(music_file, track_count)
	# fill in the missing code
	name = music_file.gets()
	location = music_file.gets()
  # print(name,location)
	track = Track.new(track_count, name, location)
	return track
end

# Returns an array of tracks read from the given file

def read_tracks(music_file)
	
	track_count = music_file.gets().to_i()
  tracks = Array.new()

	i = 0
	while (i < track_count)
			track = read_track(music_file, track_count)
			tracks << track
			i = i+1
	end
	# if (!tracks || tracks.nil?)
	# 	print("3")
	# end
	return tracks
end

# Takes an array of tracks and prints them to the terminal


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

# search for album by name.
# Returns the index of the album or -1 if not found
def search_for_album_name(albums, search_string)
  matching_index = -1
  i = 0
    while (i < albums.length)
      # print("Name ",tracks[i].name)
      if (albums[i].name.chomp == search_string.chomp)
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

def main_menu()
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
      albums = Read_music_file()
    when 2
      Display_albums(albums)
    when 3
      play_album1()
    when 4
      Update_album1()
    when 5
      finished = true
    else
      puts "Please select again"
    end
  end until finished
end

# complete the case statement below and
# add a stub like the one above for option 2
# of this main menu
def main()
  main_menu()
end
	
main()