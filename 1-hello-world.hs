myInfo = [("name","Dominick Gendill"), ("birth","1984-03-01")]

doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleEven x = if x `mod` 2 == 0
					then x*2
					else x