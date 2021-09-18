require "tty-table"

#these are the pools the characters can pull from
$big_chars = ("A".."Z").to_a + ("0".."9").to_a + %w( # $ % & ) + %w(九 七 二 人 入 八 力 十 下 三 千 上 口 土 夕 大 女 子 小 山 川 五 天 中 六 円 手)
$med_chars = %w(; < > * ! ? { } : - _ + =)
$sml_chars = %w(. , ` ' " ^ ~)

$rows = [
  row1 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row2 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row3 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row4 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row5 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row6 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row7 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row8 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row9 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row10 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row11 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row12 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row13 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row14 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row15 = [" ", " ", " ", " ", " ", " ", " ", " "],
  row16 = [" ", " ", " ", " ", " ", " ", " ", " "],
]

#this is a way to have multiple snakes starting and stopping at different times
$lives = [36, 40, 46, 48, 54, 60]

#these are the matrix code thingies
snakes = [
  snake1 = { row: rand(6..15), column: rand(0..7), life: $lives.sample },
  snake2 = { row: rand(6..15), column: rand(0..7), life: $lives.sample },
  snake3 = { row: rand(6..15), column: rand(0..7), life: $lives.sample },
  snake4 = { row: rand(6..15), column: rand(0..7), life: $lives.sample },
  snake5 = { row: rand(6..15), column: rand(0..7), life: $lives.sample },
  snake6 = { row: rand(6..15), column: rand(0..7), life: $lives.sample },
  snake7 = { row: rand(6..15), column: rand(0..7), life: $lives.sample },
]

#green-ify's the text
class String
  def green
    "\e[32m#{self}\e[0m"
  end
end

#method for changing the characters on screen
def matrix(snake)
  #resets the snake after it dies
  if snake[:life] == -2
    snake[:life] = $lives.sample
    snake[:column] = rand(0..7)
  end

  #generates the snake to make it seem like it's moving
  if snake[:life] > 36
  elsif snake[:life] > 30
    $rows[snake[:row]][snake[:column]] = $big_chars.sample.green
  elsif snake[:life] > 27
    $rows[snake[:row] - 0][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 1][snake[:column]] = $big_chars.sample.green
  elsif snake[:life] > 24
    $rows[snake[:row] - 0][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 1][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 2][snake[:column]] = $med_chars.sample.green
  elsif snake[:life] > 21
    $rows[snake[:row] - 0][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 1][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 2][snake[:column]] = $med_chars.sample.green
    $rows[snake[:row] - 3][snake[:column]] = $med_chars.sample.green
  elsif snake[:life] > 18
    $rows[snake[:row] - 0][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 1][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 2][snake[:column]] = $med_chars.sample.green
    $rows[snake[:row] - 3][snake[:column]] = $med_chars.sample.green
    $rows[snake[:row] - 4][snake[:column]] = $sml_chars.sample.green
  elsif snake[:life] > 15
    $rows[snake[:row] - 0][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 1][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 2][snake[:column]] = $med_chars.sample.green
    $rows[snake[:row] - 3][snake[:column]] = $med_chars.sample.green
    $rows[snake[:row] - 4][snake[:column]] = $sml_chars.sample.green
    $rows[snake[:row] - 5][snake[:column]] = $sml_chars.sample.green
  elsif snake[:life] > 12
    $rows[snake[:row] - 0][snake[:column]] = " "
    $rows[snake[:row] - 1][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 2][snake[:column]] = $med_chars.sample.green
    $rows[snake[:row] - 3][snake[:column]] = $med_chars.sample.green
    $rows[snake[:row] - 4][snake[:column]] = $sml_chars.sample.green
    $rows[snake[:row] - 5][snake[:column]] = $sml_chars.sample.green
  elsif snake[:life] - 0 > 9
    $rows[snake[:row] - 1][snake[:column]] = " "
    $rows[snake[:row] - 2][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 3][snake[:column]] = $med_chars.sample.green
    $rows[snake[:row] - 4][snake[:column]] = $sml_chars.sample.green
    $rows[snake[:row] - 5][snake[:column]] = $sml_chars.sample.green
  elsif snake[:life] > 6
    $rows[snake[:row] - 2][snake[:column]] = " "
    $rows[snake[:row] - 3][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 4][snake[:column]] = $sml_chars.sample.green
    $rows[snake[:row] - 5][snake[:column]] = $sml_chars.sample.green
  elsif snake[:life] > 3
    $rows[snake[:row] - 3][snake[:column]] = " "
    $rows[snake[:row] - 4][snake[:column]] = $big_chars.sample.green
    $rows[snake[:row] - 5][snake[:column]] = $sml_chars.sample.green
  elsif snake[:life] > 0
    $rows[snake[:row] - 4][snake[:column]] = " "
    $rows[snake[:row] - 5][snake[:column]] = $big_chars.sample.green
  else
    $rows[snake[:row] - 5][snake[:column]] = " "
  end
  snake[:life] -= 1
end

#this is the main loop, which runs forever
while true
  snakes.each { |snake| matrix(snake) }
  system("clear")
  table = TTY::Table.new(rows: $rows)
  puts table.render(:basic, column_widths: 2, alignment: [:center])
  sleep(0.05)
end
