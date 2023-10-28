# This is item.rb it reps an item class
module GameAuthor
  def list_games
    if @games.empty?
      puts 'No games found.'
    else
      puts 'List of Games:'
      @games.each_with_index do |game, index|
        display_game(game, index)
      end
    end
  end

  def display_game(game, index)
    id_text = "ID: #{game.id}"
    publish_date_text = "Published Date: #{game.publish_date}"
    multiplayer_text = "Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}"
    last_played_text = "Last Played: #{game.last_played_at}"

    puts "#{index + 1}, #{id_text}, #{publish_date_text}, #{multiplayer_text}, #{last_played_text}"
  end

  def list_authors
    if @authors.empty?
      puts 'No authors found.'
    else
      puts 'List of Authors:'
      @authors.each do |author|
        puts "Full Names: #{author.first_name}#{author.last_name}"
      end
    end
  end

  def add_game
    puts 'Let\'s add a new game'
    publish_date = input_dates('When was the game published(yyyy-mm-dd):')
    multiplayer = input_multiplayer
    last_played = input_dates('When did you last play the game(yyyy-mm-dd):')
    game = Game.new(publish_date, multiplayer, last_played)
    @games.push(game)

    puts 'Hurray! Game created'
  end

  def input_dates(prompt)
    print prompt
    gets.chomp.to_s
  end

  def input_multiplayer
    print 'Is the game a multiplayer game? (Y/N): '
    choice = gets.chomp.downcase
    case choice
    when 'y' then true
    when 'n' then false
    else
      puts 'Invalid choice!'
      exit
    end
  end
end
