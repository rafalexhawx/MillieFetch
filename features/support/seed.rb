folders = [{:folder_id => 1, :name => "Donald Trump's Foreign Policy"},
           {:folder_id => 2, :name => "President Donald J. Trump's Foreign Policy Puts America First"},
           {:folder_id => 3, :name => "The Hill: The Memo: Tillerson Flap Puts Spotlight ON TRUMP's FOreign POLICY moves"},
           {:folder_id => 4, :name => "G20 SUbsidies TOK oil, gas and coal production china"},
           {:folder_id => 5, :name => "IMI: UZBEKISTAN'S second oil and gas show held"},
           {:folder_id => 6, :name => "Empty Promises G20 subsidies tol oil, gas and coal production"},
           {:folder_id => 7, :name => "The Enbridge pipeline tar sands oil spill into the kalamazoo river in michigan"},
           {:folder_id => 8, :name => "9/15 TRANSCRIPT OF THE ENBRIDGE PIPELINE OIL SPILL HEARING"},
           {:folder_id => 9, :name => "United nations framework convention on climate change"},
           {:folder_id => 10, :name => "U.S. views on global climate change"},
           {:folder_id => 11, :name => "Argentina: A useful partner on climate change"},
           {:folder_id => 12, :name => "Human rights developments in argentina-"},
           {:folder_id => 13, :name => "NGO assessment of the human rights requirements in foreign military financing assistance to mexico"},
           {:folder_id => 14, :name => "Human rights first - guantanamo: A comprehensive exit strategy"},
           {:folder_id => 15, :name => "Some news updates regarding U.S - Ukraine relations"},
           {:folder_id => 16, :name => "Some western media updates regarding U.S - Ukraine relations"},
           {:folder_id => 17, :name => "Latest U.S media reporting on Ukraine"}
]

folders.each do |folder|
    Folder.create!(folder)
end
