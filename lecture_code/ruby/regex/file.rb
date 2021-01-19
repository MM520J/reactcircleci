f = File.open("file2.txt")
regex = /^([A-Z][a-z0-9]+): ([0-9]{3})-([0-9]{3})-([0-9]{4})$/
phonebook = {}
line = f.