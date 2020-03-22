# Calil_API_Library_Search
カーリルAPIを使った図書検索

# 今のところの使い方（docker）

1. `docker build library_search .`
2. `docker run -it library_search /bin/bash`
3. APIの実行
    - 図書館検索 : `ruby GetLibraries.rb`
    - 蔵書検索 : `ruby SearchBook.rb`
