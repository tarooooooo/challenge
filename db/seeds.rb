# This file should contain all the record creation needed to create the database with its default values.
# The data can then be loaded with the rails db:create command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create(name:"勉強", image_id:"study.png")
Genre.create(name:"仕事", image_id:"work.png")
Genre.create(name:"家事", image_id:"clean.png")
Genre.create(name:"趣味", image_id:"hobby.png")
Genre.create(name:"早起き", image_id:"bed.png")
Genre.create(name:"健康・美容", image_id:"green.png")
Genre.create(name:"睡眠", image_id:"bed.png")
Genre.create(name:"スポーツ", image_id:"soccer.png")
Genre.create(name:"ランニング", image_id:"run.png")
Genre.create(name:"トレーニング", image_id:"training.png")
Genre.create(name:"ウォーキング", image_id:"walk.png")
Genre.create(name:"マインドフルネス", image_id:"mind.png")

Tag.create(id: 1,name: '主婦')
Tag.create(id: 2,name: '会社員')
Tag.create(id: 3,name: '学生')
Tag.create(id: 4,name: 'プログラミング')
Tag.create(id: 5,name: 'スポーツ')
Tag.create(id: 6,name: '受験')
Tag.create(id: 7,name: 'ゲーム')
Tag.create(id: 8,name: '健康')
Tag.create(id: 9,name: 'YouTube')
Tag.create(id: 10,name: '読書')
Tag.create(id: 11,name: 'キャンプ')

    