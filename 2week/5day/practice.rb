test_hash = {
    "Search" => [{
        Title: "Jaws",
        Data: {Year: 1975, Rating: 'PG', Runtime: '124 min'},
        Director: "Steven Spielberg"},
        {
        Title: "Die Hard",
        Data: {Year: 1988, Rating: 'R', Runtime: '131 min'},
        Director: "John McTiernan"}]}  


 my_hash = test_hash['Search'] 
 puts my_hash[1][:Data][:Year]