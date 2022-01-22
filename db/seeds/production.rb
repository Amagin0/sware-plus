Customer.create!(name: 'admin', email: "#{ENV['EMAIL']}", password: "#{ENV['PASSWORD']}", admin: 'true', id: '0')
Customer.create!(name: 'test', email: 'test@test', password: 'testpass', id: '100')

Genre.create([{ genre_name: '#チョコレート' }, { genre_name: '#クッキー/ビスケット' }, { genre_name: '#キャンディ' }, { genre_name: '#アイス' }, { genre_name: '#ケーキ' },
              { genre_name: '#飲料' }, { genre_name: '#酒' }, { genre_name: '#カップ麺' }, { genre_name: '#果物' }, { genre_name: '#野菜' }, { genre_name: '#スナック' },
              { genre_name: '#米菓' }, { genre_name: '#シリアル' }, { genre_name: '#豆菓子' }, { genre_name: '#ドライフルーツ' }, { genre_name: '#催事' },
              { genre_name: '#ネタ' }, { genre_name: '#チップス' }, { genre_name: '#パイ' }, { genre_name: '#グミ' }, { genre_name: '#駄菓子' }])