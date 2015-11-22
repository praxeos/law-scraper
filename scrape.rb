require 'mechanize'

m = Mechanize.new

page = m.get('http://unfccc.int/meetings/paris_nov_2015/session/9126.php')


def get_links(page)
  documents_page = page.link_with(text: 'Documents').click

  puts documents_page.search('//a[.="EN"]/@href')

  get_links(page.link_with(text: 'previous').click)
end

get_links(page)
