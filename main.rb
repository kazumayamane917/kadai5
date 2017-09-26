# coding: utf-8
require 'dxruby'


require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600

player_img = Image.load("hikouki.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)

enemies = []
5.times do
  enemies << Enemy.new(rand(800), rand(600), enemy_img)
end



Window.loop do

enemies << Enemy.new(rand(800), rand(600), enemy_img)
  break if Input.keyPush?(K_ESCAPE)

  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.update
  player.draw

  # 当たり判定
  Sprite.check(player, enemies)
end


