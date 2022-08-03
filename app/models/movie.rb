class Movie < ActiveRecord::Base
  def self.create_with_title title
    Movie.create title: title
  end

  def self.first_movie
    Movie.first
  end

  def self.last_movie
    Movie.last
  end

  def self.movie_count
    Movie.count
  end

  def self.find_movie_with_id id
    Movie.find_by_id id
  end

  def self.find_movie_with_attributes attrs
    # NOTE: Could prolly also do attrs.each
    attr_keys_str = "find_by_#{attrs.keys.to_s.split.join('_and_').gsub(/[\[\],:]/, '')}"
    # NOTE: * is splat operator
    Movie.send(attr_keys_str, *attrs.values)
  end

  def self.find_movies_after_2002
    Movie.where('release_date > 2002')
  end

  def update_with_attributes attr
    update attr
  end

  def self.update_all_titles attr
    Movie.update_all(title: attr)
  end

  def self.delete_by_id id
    Movie.destroy_by(id: id)
  end

  def self.delete_all_movies
    Movie.destroy_all
  end
end
