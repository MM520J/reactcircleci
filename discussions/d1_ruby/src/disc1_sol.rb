def sum()
    a = [1,2,3,4,5]
    sum = 0
    a.each { |x| sum += x }

    puts sum
end

def multiply()
    a = [1,2,3,4,5]
    a.collect! { |x| x*2 }

    puts a.join(',')
end

def population()
    countries = {} 
    countries["USA"] = 319 
    countries["Italy"] = 60

    countries.each { |k,v| 
        puts "population of #{k} is #{v} million"
    }
end

def splitString(s)
    for word in s.split(',')
        yield word
    end
end


distan