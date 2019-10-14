class Player
  def hand
    while true
      puts "数字を入力してください。"
      puts "0: グー"
      puts "1: チョキ"
      puts "2: パー"
      number = gets.to_i

      if number <= 2 && /^[0-9]+$/
        return number
      else
        puts "「0〜2の数字を入力してください。」"
      end
    end
  end
end

class Enemy
  def hand
    janken = [0,1,2]
    return janken.sample
  end
end

class Janken
  def pon(player_hand, enemy_hand)

    if enemy_hand == 0
      name = "グー"
    elsif enemy_hand == 1
      name = "チョキ"
    else
      name = "パー"
    end

    while true
      if (player_hand-enemy_hand+3)%3==2
        puts "相手の手は#{name}です。あなたの勝ちです"
        break
      elsif (player_hand-enemy_hand+3)%3==1
        puts "相手の手は#{name}です。あなたの負けです"
        break
      else
        puts "あいこです。"
        player = Player.new
        enemy = Enemy.new
        janken = Janken.new
        janken.pon(player.hand, enemy.hand)
        break
      end
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

janken.pon(player.hand, enemy.hand)

# ① player = Player.newの記述の意味
     # Playerクラスからインスタンスを作成しplayerに代入
# ② 大文字のPlayerと小文字のplayerの違い
     # Playerはクラス名、playerは変数名
