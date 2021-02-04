class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents.each do |c|
      self.notes.new(content: c) if c.strip != ""
    end
  end

  def note_contents
    self.notes.map { |n| n.content }
  end

end