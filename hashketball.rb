# Write your code here!
require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  array = []
  game_hash.each do |team, data|
    data.each do |name, stats|
     if name == player_name
       array << game_hash[team][data][name][:points]
    end
  end
end
array
end  
    
def shoe_size(player_name)
  game_hash.each do |team, data|
    data.each do |name, stats|
     if name.include?(player_name)
       return game_hash[team][data][name][:shoe_size]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.collect do |team, values|
       if values[:team_name] == team_name
        values[:colors]
      end
  end.join("")
end

def team_names
  hash = game_hash
  arr = []
  hash.each do |team, values|
    values.each do |data, data_value|
      if data == :team_name
        arr << data_value
      end
    end
  end
  return arr
end

def player_numbers(team_name)
  nums = [] 
  game_hash.collect do |team, value|
    if value[:team_name] == team_name
      value[:players].collect do |player, data|
        nums.push(data[:number])
      end 
    end 
  end 
nums
end 

def player_stats(name)
  game_hash.each do |team, data| 
    data.each do |data_point, value| 
      if game_hash[team][data].values.include?(name)
       return game_hash[team][data][name]
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = (2**(0.size * 8 -2) -1)
  hash.each do |team, data|
   data.each do |data_point, value|
      if value.class == Hash
        value.each do |player, stats|
            stats.each do |stat, shoes|
              if stat == :shoe
                if shoes > shoe_size
                  shoe_size = shoes
                  player_name = player
                end
              end
            end
          end
        return hash[team][data_point][player][:rebounds]
      end
    end
  end
end

