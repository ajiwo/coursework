# toc

toc = [ [1, 'Numbers', 1], [2, 'Letters', 72], [3, 'Variables', 118] ]

title = 'Table of Contents'
lwidth = 50


puts title.center(lwidth)

toc.each do |item|
  chapter = "Chapter #{item[0]}:  #{item[1]}"
  page = "page #{item[2]}"
  
  puts chapter.ljust(lwidth/2) + page.rjust(lwidth/2)
end
