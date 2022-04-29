# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" , name: "Lord of the Rings", salt) )
#   Character.create(name: "Luke", movie: movies.first)
salt = "$2a$12$wtuYetyze2U24iIEvOGb3O"
puts("Started database seeding")

Account.create(username: "BushBrouhaha" , password_digest:  BCrypt::Engine.hash_secret("ab88a88daf4a95c9aba72f95adb4f1460d3280e3a30bf3ea0bf8f22d76501c7e", salt) )
Account.create(username: "BushImpostume" , password_digest:  BCrypt::Engine.hash_secret("ae5e4e50f40b522ea48de08b8bfa26df82663393cb1181e4c11473613766fe1e", salt) )
Account.create(username: "BushStanchion" , password_digest:  BCrypt::Engine.hash_secret("3ed23adfc04c5eb74b9515eb0eb7148e1bc1a253569101428be35a55c99bad80", salt) )
Account.create(username: "BushPatrology" , password_digest:  BCrypt::Engine.hash_secret("5e34eb3d45d69c3fb3cc825c12a828bb4e8a3032d0b022841b50e541202b7fc8", salt) )
Account.create(username: "BushGuttersnipe" , password_digest:  BCrypt::Engine.hash_secret("aff224730d8456f22aa5dd74408fa14498d96264c5ef8b8ffec294ce5970c3f7", salt) )
Account.create(username: "BushFoison" , password_digest:  BCrypt::Engine.hash_secret("4f4b1b23a855b6a7e2eeed6861205b08e2c5abf885cbb8f6917a4bcff1787791", salt) )
Account.create(username: "BushProsodemic" , password_digest:  BCrypt::Engine.hash_secret("a859a07134e22890460d285015df9033272f6bed8cc1e5188575037c22ec9160", salt) )
Account.create(username: "BushEquestrian" , password_digest:  BCrypt::Engine.hash_secret("36140f0e098c6debae1e0b7e401ec23b76c2a34809ccc1e650ddaac4667deb91", salt) )
Account.create(username: "BushEclosion" , password_digest:  BCrypt::Engine.hash_secret("268a85f3e4b6cc4a7a51dd2d142f8291a689769f9dc0b7c5fae77bf0886bc612", salt) )
Account.create(username: "BushMoilsome" , password_digest:  BCrypt::Engine.hash_secret("46e98395dd7e307f58202cf38c04f8489ae2b2187c150235668418e321ac8525", salt) )
Account.create(username: "BushOrtanique" , password_digest:  BCrypt::Engine.hash_secret("5e1cf36d21978d21d686cc5e08ced4a4ff1ca83b98b8fc4953b2c977cab7c321", salt) )
Account.create(username: "BushPolysarcous" , password_digest:  BCrypt::Engine.hash_secret("a8de99cb01102fe8e51ae4293d0d2b43a35e2a5cb7904f19de435daa13e93c34", salt) )
Account.create(username: "BushJungli" , password_digest:  BCrypt::Engine.hash_secret("29ca2a149a50334122daeed6cd7131bd466bee3ef7864751523ccffdcdbe12ed", salt) )
Account.create(username: "BushPed" , password_digest:  BCrypt::Engine.hash_secret("bc8cdff9d602032a60316e37186c663a0c427d67d30123d9eb91e56a43713863", salt) )
Account.create(username: "BushSheol" , password_digest:  BCrypt::Engine.hash_secret("dfe646d3606b0a70f86d48fd95afc3fadede77f0c53408207783d24fb21df5f6", salt) )
Account.create(username: "BushAppaloosa" , password_digest:  BCrypt::Engine.hash_secret("220640ee67d9370a8fe841b98bef6fd819c9101c831226c9b2888dc512850702", salt) )
Account.create(username: "BushImprovement" , password_digest:  BCrypt::Engine.hash_secret("659eed21aff8022c2d45179fdfcf410fa1cdb8149ed6cfe8048f3517f6ca5ded", salt) )
Account.create(username: "BushIndulgence" , password_digest:  BCrypt::Engine.hash_secret("381872814d1052465cfb3c76f3ddce68db3ed92fc3b5d5587bfc2a351b1ab3e7", salt) )
Account.create(username: "BushPartible" , password_digest:  BCrypt::Engine.hash_secret("8511566890a593588eb7abc17dd02743a1492c608b0073189d70a919e32d5e84", salt) )
Account.create(username: "BushOvil" , password_digest:  BCrypt::Engine.hash_secret("942829db32bf3838d2d86597aec64597495842a111b5eb6fc922bf3decce9c0c", salt) )
Account.create(username: "BushVoiturier" , password_digest:  BCrypt::Engine.hash_secret("bf1e6a10428250156b3d6ce3eaccf3ab1fbd7bebc159e7551359be3bdaebd2ea", salt) )
Account.create(username: "BushAligerous" , password_digest:  BCrypt::Engine.hash_secret("3b79b3576957c5a23ced16d20adb8bb697eafd6fcaab026ce8d70270f1679eab", salt) )
Account.create(username: "BushBraggadocio" , password_digest:  BCrypt::Engine.hash_secret("bd330c4b228def562c1a566dbad6cbc9fdf5623c6fa3e5d23fa9e41f935ee70b", salt) )
Account.create(username: "BushSequacious" , password_digest:  BCrypt::Engine.hash_secret("69e668295bd4013e886de2fccb3d64bd3f0a0d09c6fc80314fcd919998089b0c", salt) )
Account.create(username: "BushOdonterism" , password_digest:  BCrypt::Engine.hash_secret("3d7ebaa52bd97e3dd3ae1ba06592d3593f279ef9201c07f9b95b3ce0370d3eeb", salt) )
Account.create(username: "BushAurifex" , password_digest:  BCrypt::Engine.hash_secret("85e62c1b3679e001dbd65f38e20b835897f78d5550f20162baad81c906fcf089", salt) )
Account.create(username: "BushCriterion" , password_digest:  BCrypt::Engine.hash_secret("84d82910633c60c1bcb678d725c65e139503ef441458dcf98f37af39d700baee", salt) )
Account.create(username: "BushDuarf" , password_digest:  BCrypt::Engine.hash_secret("5b867fcd1eebb0fe989547a7aeea6a13f526ae5ea169a06d5dd1f25a714df2c3", salt) )
Account.create(username: "BushIngerence" , password_digest:  BCrypt::Engine.hash_secret("f911c7fbf604fae25bb006230d69692a208c9eca9d1a0bc0cc353f844514d0bf", salt) )
Account.create(username: "BushHendiadys" , password_digest:  BCrypt::Engine.hash_secret("56522e32537732a72c57127ade74fdf422d04c5fa2f1b65611eefd9a8c5aa1a5", salt) )
Account.create(username: "NoogenesisBush" , password_digest:  BCrypt::Engine.hash_secret("43ba8dbcc2b9d6adf338c61f31dafcc4b8e4168eb6168de2a025d69dc9aabdad", salt) )
Account.create(username: "ParbuckleBush" , password_digest:  BCrypt::Engine.hash_secret("01df18cb96485e17c07cafae03f7fdc502fe360a58f3605abcbf5b2b919c52c6", salt) )
Account.create(username: "OmniferousBush" , password_digest:  BCrypt::Engine.hash_secret("bafe3a0016c82a428ad96f74717d0337413ca39cec7f1851a03e18963af6e285", salt) )
Account.create(username: "TaminBush" , password_digest:  BCrypt::Engine.hash_secret("0d0a86471e9174c8baad95ecbd599076c4388d0eaaad7de761aa668649463527", salt) )
Account.create(username: "ParacoitusBush" , password_digest:  BCrypt::Engine.hash_secret("f84b3399220053881685f36402eecb59bacff658eb63b3e3fd0be5f23e0e398e", salt) )
Account.create(username: "SplatBush" , password_digest:  BCrypt::Engine.hash_secret("f064b4bdbed1d03de88e1a52066afb2738850e839037e9631421ff34eafd2d6d", salt) )
Account.create(username: "OrantBush" , password_digest:  BCrypt::Engine.hash_secret("8ecfe7a4fb3a287dab376bd419325260990f13f54065630dc37ef04ffd54c0f1", salt) )
Account.create(username: "QuatridualBush" , password_digest:  BCrypt::Engine.hash_secret("5c7fb09c515112aab1d8aa8cc817e68a7d57e226f60aa28eeaa294ed27eed5ed", salt) )
Account.create(username: "ImprovidentBush" , password_digest:  BCrypt::Engine.hash_secret("764589e8a22b3ddbc2555b1a91fe5a91a61cb81bfe9a0da440f5d1997b75d873", salt) )
Account.create(username: "ForestwasBush" , password_digest:  BCrypt::Engine.hash_secret("8346225a5248fec8e125dd9d84045dac883cad69bc9651a54fc505b944af6190", salt) )
Account.create(username: "AmiableBush" , password_digest:  BCrypt::Engine.hash_secret("7344fbe14cc081f173044f9897d580cbff91953aedc73e40dd53fa360f3e8188", salt) )
Account.create(username: "RadicalBush" , password_digest:  BCrypt::Engine.hash_secret("d1707aa75866b634252679a5baf8eee0bddd4bdbc6a57f3664e1822f7a533c7d", salt) )
Account.create(username: "WabbitBush" , password_digest:  BCrypt::Engine.hash_secret("8dc253f997ed4090d711ef9e1397390411a8891f056163ac8d3ca12d39979939", salt) )
Account.create(username: "PhlebologyBush" , password_digest:  BCrypt::Engine.hash_secret("24e2ea8b654fc6026f5da8dd1afe9dac644908d1c7c4ba463e10d88a18a00cdd", salt) )
Account.create(username: "ParabolaBush" , password_digest:  BCrypt::Engine.hash_secret("9178f838a513fcc9c9070b25afb490c3d9c07a2f79392ae4b75dcc35a196a896", salt) )
Account.create(username: "MemoriterBush" , password_digest:  BCrypt::Engine.hash_secret("2868dd70ee8c2e27e518b82f57a9f5f8f157b248bb64da1ccfaa497c9185d90c", salt) )
Account.create(username: "ZippyBush" , password_digest:  BCrypt::Engine.hash_secret("307607f6495a61fa5057b51f10f3274c87a827490565cbf5c8a0b78b8117f224", salt) )
Account.create(username: "GueBush" , password_digest:  BCrypt::Engine.hash_secret("0a3b4c69dadc62dbeb20f921a1d33381bd05688a4e93644807318a10bbbbb215", salt) )
Account.create(username: "FiascoBush" , password_digest:  BCrypt::Engine.hash_secret("d1265bec5a77fae71389f929fdca42429e9a86eca90c430a6629602e82a79b6d", salt) )
Account.create(username: "ZorroBush" , password_digest:  BCrypt::Engine.hash_secret("1654db4c221ea1f56526220195aa5b68ceca346776babe6274e5930bbad57f15", salt) )
Account.create(username: "IlkeBush" , password_digest:  BCrypt::Engine.hash_secret("b6f78045def5809021ed183ab4fa9daefa7a030ae4bfd9044efb43d5dd2781b5", salt) )
Account.create(username: "BottomryBush" , password_digest:  BCrypt::Engine.hash_secret("eb1ce3c5d5dbca75e17d92bd2a49055950eec22e038e1ee28d163563ba8a3017", salt) )
Account.create(username: "ClepeBush" , password_digest:  BCrypt::Engine.hash_secret("8788b3deb2d06b2637c84a62a52526ddf5c1860e6631101152ad0a0016119412", salt) )
Account.create(username: "GeekBush" , password_digest:  BCrypt::Engine.hash_secret("2e3f534f558b20055302d89e95d02ba8175dd8664149852c8a5b8971194c8f35", salt) )
Account.create(username: "PiccadillyBush" , password_digest:  BCrypt::Engine.hash_secret("3850003b01c4e16fd7cca9a0ed86fefb13cdff698d1778f6e71651693d781479", salt) )
Account.create(username: "MirthfulBush" , password_digest:  BCrypt::Engine.hash_secret("725d8e8adf63b46682f138ddf14ad7ef5d46c84b22e5cfc7470cda72abb00215", salt) )
Account.create(username: "StaccatoBush" , password_digest:  BCrypt::Engine.hash_secret("5688c5af3e6f8f730a2b55ed73611612ff612883ba464f6dfe6686479a504c2e", salt) )
Account.create(username: "IconoclasmBush" , password_digest:  BCrypt::Engine.hash_secret("7581ab8a8b6867fab134d0d85d65106e1c648cfa59eb01ad3095ba950140a662", salt) )
Account.create(username: "MersionBush" , password_digest:  BCrypt::Engine.hash_secret("5882f039190420906fe86a0e5668987bc8fb926a520c67aecf8e4c250dc5ffc8", salt) )
Account.create(username: "PsittacismBush" , password_digest:  BCrypt::Engine.hash_secret("1292ee860bf779ed114d9b16aac2b07015084072849a6544414c36a237bf6608", salt) )
Account.create(username: "GeorgeBush" , password_digest:  BCrypt::Engine.hash_secret("84b1855f5d11242989d961b857cb510e9a5204e6df4b3ea09a02b6eb1981f199", salt) )
Account.create(username: "GeorgeHWBush" , password_digest:  BCrypt::Engine.hash_secret("e3f0d911a8bacb24e50332638c1a686d34b18236464b3cb5478384df04d67d4f", salt) )

puts("End of database seeding")
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# folders = [{:folder_id => 1, :name => "Donald Trump's Foreign Policy"},
#            {:folder_id => 2, :name => "President Donald J. Trump's Foreign Policy Puts America First"},
#            {:folder_id => 3, :name => "The Hill: The Memo: Tillerson Flap Puts Spotlight ON TRUMP's FOreign POLICY moves"},
#            {:folder_id => 4, :name => "G20 SUbsidies TOK oil, gas and coal production china"},
#            {:folder_id => 5, :name => "IMI: UZBEKISTAN'S second oil and gas show held"},
#            {:folder_id => 6, :name => "Empty Promises G20 subsidies tol oil, gas and coal production"},
#            {:folder_id => 7, :name => "The Enbridge pipeline tar sands oil spill into the kalamazoo river in michigan"},
#            {:folder_id => 8, :name => "9/15 TRANSCRIPT OF THE ENBRIDGE PIPELINE OIL SPILL HEARING"},
#            {:folder_id => 9, :name => "United nations framework convention on climate change"},
#            {:folder_id => 10, :name => "U.S. views on global climate change"},
#            {:folder_id => 11, :name => "Argentina: A useful partner on climate change"},
#            {:folder_id => 12, :name => "Human rights developments in argentina-"},
#            {:folder_id => 13, :name => "NGO assessment of the human rights requirements in foreign military financing assistance to mexico"},
#            {:folder_id => 14, :name => "Human rights first - guantanamo: A comprehensive exit strategy"},
#            {:folder_id => 15, :name => "Some news updates regarding U.S - Ukraine relations"},
#            {:folder_id => 16, :name => "Some western media updates regarding U.S - Ukraine relations"},
#            {:folder_id => 17, :name => "Latest U.S media reporting on Ukraine"}
# ]

# folders.each do |folder|
#     Folder.create!(folder)
# end

require 'simple_xlsx_reader'
#puts Dir.pwd

workbook = SimpleXlsxReader.open 'db/ScowcroftCollection.xlsx'
worksheets = workbook.sheets
puts "Found #{worksheets.count} worksheets"

worksheets.each do |worksheet|
  puts "Reading: #{worksheet.name}"
  num_rows = 0
  total_rows = worksheet.rows.count
  sample_rows = (1...total_rows).to_a.sample(200, random: Random.new(22))
  #puts sample_rows
  #puts 'end'
  #puts worksheet.rows[3]

  sample_rows.each do |r|
    row_cells = worksheet.rows[r]

    Folder.create!(
        folder_title: row_cells[3]
    )

    Metadatum.create!(
        FOIA_ID: row_cells[0],
        local_id: row_cells[1],
        status: row_cells[2],
        record_collection: row_cells[4],
        office_origin: row_cells[5],
        series: row_cells[6],
        subseries: row_cells[8],
        box_type: row_cells[7],
        box_number: row_cells[10],
        note_field: row_cells[9],
        folder_id: Folder.maximum(:id)
    )

    Content.create!(
        content_path: '/file/' + row_cells[3] + '/sample.pdf',
        metadatum_id: Metadatum.maximum(:id),
        folder_id: Folder.maximum(:id)
    )


    #puts row_cells[3]
  end
  
end
