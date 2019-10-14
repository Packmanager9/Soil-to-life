require "TextGrapher"

$xrange = 30
$yrange =  30
$count = 0
$countclone = 0
$start = 0
$step = 100
$stepstotal = 1000
$dotstotal = ($stepstotal*$step)+1


class Fighter

attr_accessor :name, :upratio, :downratio, :position, :coordinate, :status, :x, :y, :clonecount, :all
@@all = []
def initialize(name, x, y, status)
    #def initialize(name = "Unknown", upratio = 0.3, downratio = 0.7, position = 3, x = 0, y = 0, status = "Alive", clonecount = 0)
   
    if x > $xrange
        x = $xrange
        end
        if y > $yrange
            y = $yrange
            end
            if x < 0
                x = 0
                end
                if y < 0
                    y = 0
                    end

   @coordinate =  (Position.new(x.to_i, y.to_i, true)) 
    @name = name
    #@upratio = upratio
   # @downratio = downratio
    #@position =position
    @status = status
    @x = x.to_i
    @y = y.to_i
   # if @@all.include?(self) == false
    @@all << self
    #end
   #@@all.uniq!
 #  puts @@all.length
    #@countclone = clonecount
end

#@@all[0..$dotstotal] = Fighter.new("Hello")
def self.all
    @@all
end

def self.fight (opponent)
#puts "FIg"
if opponent.name == "Paper" && @name == "Rock"
    @status = "Lost"
    @name = "Unknown"
end
if opponent.name == "Rock" && @name == "Scissors"
    @status = "Lost"
    @name = "Unknown"
end
if opponent.name == "Scissors" && @name == "Paper"
    @status = "Lost"
    @name = "Unknown"
end
if @name == "Unknown" 
    @status = "Lost"
    @name = "Unknown"
end
#puts self.name + opponent.name

if opponent.name != self.name && (self.status != "Lost" && opponent.status != "Lost")
#opponent.fight(self)
end

if self.status == "Lost"
return false
else
    return true
end
end

def self.deleter(obj)
    #obj.clear
   obj = nil
    #@@all.delete(obj)
end

def clonex

    #if self.name == "Scissors"
       # scissorsxy = Fighter.new("Scissors", 1.1, 1, 3, self.x,self.y,"Alive")
       # clone =scissorsxy
      #  elsif self.name == "Rock"
        #rockxy = Fighter.new("Rock", 1.1, 1, 3, self.x,self.y,"Alive")
       # clone =rockxy
     #   else
          #  paperxy = Fighter.new("Paper", 1.1, 1, 3, self.x,self.y,"Alive")
        #    clone =paperxy
     #   end
        

  #  clone = Fighter.new(self.name,self.upratio, self.downratio, self.position, self.x,self.y, self.status, $countclone)
   # clone.coordinate = self.coordinate
   # x = rand(10)
=begin
    case x
    when 0
        clone.coordinate.xdim = clone.coordinate.xdim - 1 # top center
        clone.coordinate.xdim = [clone.coordinate.xdim, 0].max
    when 1
        clone.coordinate.xdim = clone.coordinate.xdim - 1 # top right
        clone.coordinate.xdim = [clone.coordinate.xdim, 0].max
        clone.coordinate.ydim = clone.coordinate.ydim + 1
        clone.coordinate.ydim = [clone.coordinate.ydim, ($yrange)].min
    when 2
        clone.coordinate.ydim = clone.coordinate.ydim - 1 # left
        clone.coordinate.ydim = [clone.coordinate.ydim, 0].max
    when 3
        clone.coordinate.xdim = clone.coordinate.xdim + 1 # bottom right
        clone.coordinate.xdim = [clone.coordinate.xdim, ($xrange)].min
        clone.coordinate.ydim = clone.coordinate.ydim + 1
        clone.coordinate.ydim = [clone.coordinate.ydim, ($yrange)].min
    when 4
        clone.coordinate.xdim = clone.coordinate.xdim + 1 # bottom center
        clone.coordinate.xdim = [clone.coordinate.xdim, ($xrange)].min
    when 5
        clone.coordinate.ydim = clone.coordinate.ydim + 1  # right
        clone.coordinate.ydim = [clone.coordinate.ydim, ($yrange)].min
    when 6
        clone.coordinate.xdim = clone.coordinate.xdim + 1 # Bottom left
        clone.coordinate.xdim = [clone.coordinate.xdim, ($xrange)].min
        clone.coordinate.ydim = clone.coordinate.ydim - 1
        clone.coordinate.ydim = [clone.coordinate.ydim, 0].max
    when 7

    when 8
        clone.coordinate.xdim = clone.coordinate.xdim - 1 # top left
        clone.coordinate.xdim = [clone.coordinate.xdim, 0].max
        clone.coordinate.ydim = clone.coordinate.ydim - 1
        clone.coordinate.ydim = [clone.coordinate.ydim, 0].max
    end
    clone.status = "Alive"
    @@all << clone
     @@all = @@all.uniq

    $countclone += 1
    clone
=end
end


end

xd = ($xrange/4).to_i
yd = ($yrange/4).to_i
scissors = Fighter.new("Scissors", (2*xd),(1*yd),"Alive")
rock = Fighter.new("Rock", (3*xd),(1*yd),"Alive")
paper = Fighter.new("Paper", (1*xd), (1*yd),"Alive")
hex = Fighter.new("Hex", 0, (3*yd),"Alive") #this adds a  new monster

#rocktestf = Fighter.new("Scissors", (2*xd),(2*yd),"Alive")
#rocktest2f = Fighter.new("Rock", (1*xd),(2*yd),"Alive")
#papertestf = Fighter.new("Paper", (3*xd), (2*yd),"Alive")

#rocktestg = Fighter.new("Scissors", xd,(3*yd),"Alive")
#rocktest2g = Fighter.new("Rock", (3*xd),(3*yd),"Alive")
#papertestg = Fighter.new("Paper", (2*xd), (3*yd),"Alive")
#water = Fighter.new("Water", (3*xd),(3*yd),"Alive")
#land = Fighter.new("Land", (2*xd), (3*yd),"Alive")

=begin
paper = Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rock = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissors = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

papera= Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rocka = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsa = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")


paperz = Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockz = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsz = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

paperaz = Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockaz = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsaz = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")


paperh= Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockh = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsh = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

paperah= Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockah = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsah = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")
=begin
paperhx= Fighter.new("Xor", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockhx = Fighter.new("Xor", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorshx = Fighter.new("Xor", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

paperahx= Fighter.new("Xor", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockahx = Fighter.new("Xor", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsahx = Fighter.new("Xor", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

paperhxg = Fighter.new("Yor", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockhxg = Fighter.new("Yor", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorshxg = Fighter.new("Yor", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

paperahxf= Fighter.new("Yor", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockahxf = Fighter.new("Yor", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsahxf = Fighter.new("Yor", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

paperhxgw = Fighter.new("Wor", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockhxgw = Fighter.new("Wor", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorshxgw = Fighter.new("Wor", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

paperahxw= Fighter.new("Wor", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
rockahxfw = Fighter.new("Wor", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsahxfw = Fighter.new("Wor", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")
scissorsahxfb = Fighter.new("Bor", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")
=end
#paperx = Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
##rockx = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
#scissorsx = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")
##paperxx = Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
#rockxx = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")
#scissorsxx = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")
#paperxy = Fighter.new("Paper", 1,0, 2, rand($xrange).to_i,rand($yrange).to_i,"Alive")
#rockxy = Fighter.new("Rock", 0.1, 1, 1, rand($xrange).to_i,rand($yrange).to_i,"Alive")


#scissorsxy = Fighter.new("Scissors", 1.1, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")
#voidish = Fighter.new("Unknown", 0.0, 1, 3, rand($xrange).to_i,rand($yrange).to_i,"Alive")

hashgrid = {}
count = 0 
countx = 0 
county = 0 
while count < ($xrange*$yrange)
            while county <= $yrange

                hashgrid["#{countx},#{county}"] = [countx, county, " "]
                #puts hashgrid
                    countx+=1
                    if countx > $xrange
                        countx = 0
                        county +=1
                    end
                count+=1
            end
    end




    count = 0 
    countx = 0 
    county = 0 
    positionarray = []
while count < ($xrange*$yrange)
            while county < $yrange
                    countx+=1
                    if countx > $xrange
                        countx = 0
                        county +=1
                    end
                    positionarray[count] = Position.new(hashgrid["#{countx},#{county}"][0], hashgrid["#{countx},#{county}"][1], false)
                count+=1
            end
    end

    def fuzzer (num, range)

     #   if rand(3) == 2
        num += rand(-2..1)
        if num < 0 
            num = range + num
        end
        if num > range
            num = num % range
        end
  #  end 
        num
        end


        def realfight(front, back)
            if front.name == back.name
                back.status = "Lost"
            end
            if front.name == "Paper" && back.name == "Rock"
                back.status = "Lost"
                back.name = "Unknown"
            end
            if front.name == "Rock" && back.name == "Scissors"
                back.status = "Lost"
                back.name = "Unknown"
            end
            if front.name == "Scissors" && back.name == "Paper"
                back.status = "Lost"
                back.name = "Unknown"
            end
            if back.name == "Unknown" 
                back.status = "Lost"
                back.name = "Unknown"
            end

            if front.name == "Hex"
                if rand(1002) > 500
                    back.status = "Lost"
                    else
                        front.status = "Lost"
                    end
            end
            #puts self.name + opponent.name
            
            if front.name != back.name && (back.status != "Lost" && front.status != "Lost")
            realfight(back, front)
            end
            
            if front == back
                back.status = "Alive"
                front.status = "Alive"
            end
            if back.status == "Lost"
            return false
            else
                return true
            end
            
            end
            
$countp = 0
def hugeblock(hashgrid)
count = 0
red = ChunkyPNG::Color.rgba(255, 0, 0, 255);
ochre = ChunkyPNG::Color.rgba(255, 255, 0, 255);
ochrey = ChunkyPNG::Color.rgba(200, 0, 255, 255);
ochrew = ChunkyPNG::Color.rgba(255, 255, 255, 255);
green = ChunkyPNG::Color.rgba(0, 255, 0, 255);
blue = ChunkyPNG::Color.rgba(20, 20, 255, 255);
black = ChunkyPNG::Color.rgba(0, 0, 0, 255);
white = ChunkyPNG::Color.rgba(255, 255, 255, 255);
pngx = ChunkyPNG::Image.new(($xrange+1).to_i, ($yrange+1).to_i, ChunkyPNG::Color::TRANSPARENT)
count = 0
Fighter.all.each do |fighter|
    x =  fighter.coordinate.xdim
    y =  fighter.coordinate.ydim

    case fighter.name
    when "Rock"
        hashgrid["#{x},#{y}"][2] = "R"
     when "Paper"
        hashgrid["#{x},#{y}"][2] = "P"
    when "Scissors"
        hashgrid["#{x},#{y}"][2] = "S"
    when "Xor"
        hashgrid["#{x},#{y}"][2] = "X"
    when "Hex"
        hashgrid["#{x},#{y}"][2] = "Y"
    when "Wor"
        hashgrid["#{x},#{y}"][2] = "W"
    when "Bor"
        hashgrid["#{x},#{y}"][2] = "B"
    else
        hashgrid["#{x},#{y}"][2] = "g"
    end
   # Fighter.all.each do |fighter| fighter = nil end
         if Fighter.all.count <$start
           # fighter.clonex
    end


end

pngarray = ""
count = 0
county = 0
countx = 0
while count < ($xrange*$yrange)-1
   #  puts  hashgrid["#{countx},#{county}"][2]
    pngarray = pngarray + hashgrid["#{countx},#{county}"][2]

    #puts fuzzer(countx, $xrange)
    if pngarray[count] == "g"
        pngx[countx , county] = black
    elsif pngarray[count] == "R"  
        pngx[countx , county] = red
        if rand(10) > 5
        Fighter.new("Rock",([fuzzer(countx, $xrange), $xrange].min).to_i,[fuzzer(county, $yrange), $yrange].min, "Alive" ) 
        end
    elsif pngarray[count] == "S"  
        pngx[countx , county] =  blue

        if rand(10) > 5
        Fighter.new("Scissors", ([fuzzer(countx, $xrange), $xrange].min).to_i,[fuzzer(county, $yrange), $yrange].min, "Alive" )
        end
    elsif pngarray[count] == "P"  
        pngx[countx , county] = green

        if rand(10) > 5
        Fighter.new("Paper", ([fuzzer(countx, $xrange), $xrange].min).to_i,[fuzzer(county, $yrange), $yrange].min, "Alive")
        end
    elsif pngarray[count] == "X"  
        pngx[countx , county] = ochre
        #Fighter.new("Xor", 0, 0 , 0, [fuzzer(countx, $xrange), $xrange].min,[fuzzer(county, $yrange), $yrange].min , "Alive", 0)
    elsif pngarray[count] == "Y"  
        pngx[countx , county] = white

        if rand(10) > 4  
        Fighter.new("Hex", ([fuzzer(countx, $xrange), $xrange].min).to_i,[fuzzer(county, $yrange), $yrange].min, "Alive")
        end
    elsif pngarray[count] == "W"  
        pngx[countx , county] = ochrew
        #Fighter.new("Wor", 0, 0 , 0, [fuzzer(countx, $xrange), $xrange].min,[fuzzer(county, $yrange), $yrange].min , "Alive", 0)
    elsif pngarray[count] == "Y"  
        pngx[countx , county] = white
        Fighter.new("Hex", 0, 0 , 0, [fuzzer(countx, $xrange), $xrange].min,[fuzzer(county, $yrange), $yrange].min , "Alive", 0)
       else
            pngx[countx , county] = black
        end
        countx+=1
        if countx > $xrange
            countx = 0
            county +=1
        end
    count += 1
end
#puts pngarray
pngarray = pngarray.chars
#puts pngarray
countx = 0
county = 0
count = 0
    while count < pngarray.length
        
    if pngarray[count] == " "  
        pngx[countx , county] = black
    elsif pngarray[count] == "R"  
        pngx[countx , county] = red
       # Fighter.new("Rock", 0, 0 , 0, [fuzzer(countx), $xrange].min,[fuzzer(county), $yrange].min, "Alive", 0)
    elsif pngarray[count] == "S"  
        pngx[countx , county] =  blue
      #  Fighter.new("Scissors", 0, 0 , 0, [fuzzer(countx), $xrange].min,[fuzzer(county), $yrange].min , "Alive", 0)
    elsif pngarray[count] == "P"  
        pngx[countx , county] = green
       # Fighter.new("Paper", 0, 0 , 0, [fuzzer(countx), $xrange].min,[fuzzer(county), $yrange].min , "Alive", 0)
    elsif pngarray[count] == "X"  
        pngx[countx , county] = ochre
        #Fighter.new("Paper", 0, 0 , 0, [fuzzer(countx, $xrange), $xrange].min,[fuzzer(county, $yrange), $yrange].min , "Alive", 0)
    elsif pngarray[count] == "Y"  
        pngx[countx , county] = white
        #Fighter.new("Paper", 0, 0 , 0, [fuzzer(countx, $xrange), $xrange].min,[fuzzer(county, $yrange), $yrange].min , "Alive", 0)
    elsif pngarray[count] == "W"  
        pngx[countx , county] = ochrew
    elsif pngarray[count] == "B"  
        pngx[countx , county] = black
        #Fighter.new("Paper", 0, 0 , 0, [fuzzer(countx, $xrange), $xrange].min,[fuzzer(county, $yrange), $yrange].min , "Alive", 0)
        else
            pngx[countx , county] = black
        end

        countx+=1
        if countx > $xrange
            countx = 0
            county +=1
        end
        count += 1
    end

def saver(pngx)
pngx.save("gifmake/#{$countp}.png")
puts $countp
end
$countp +=1
saver(pngx)

count += 1
end

count = 0


countx = 0
county = 0
count = 0
while county < $yrange
    tester = Fighter.all.select do |fighter| ((fighter.coordinate.xdim == countx)&&(fighter.coordinate.ydim == county)) end 
        #puts tester.length
    if tester[0] != nil && tester[1] != nil 
# puts "yes"
        tester.each do |layerone| 
            tester.each do |layertwo|
                realfight(layerone, layertwo)
                layertwo.fight(layerone)
            end
        
        end
       #tester[0].fight(tester[1])
       #tester.shift(2)
    end

    if countx >= $xrange
        county += 1
        countx = 0
    end
    countx += 1
end
if tester.length > 1
   # puts "Yes!"
tester.each do  |testcase| 
    tester.each do |opponentcase| 
        
        if opponentcase.fight(testcase) == false
            testcase.status = "Lost"
            testcase.name = "Unknown"
        end
        opponentcase.fight(testcase) 
    end
end
end 

#Fighter.all.each do  |fighter| 
  #  if fighter.status != "Lost"
        #pngarray[((county*$xrange)+countx)] = "g"
        #pngx[fighter.coordinate.xdim , fighter.coordinate.ydim] = black
       # puts fighter.name
      #  Fighter.deleter(fighter)
 #   end

#end
$stepstotal.times do
    hugeblock(hashgrid)
#puts Fighter.all.length
countd = 0
yid = 0
xid = 0 
    while countd < (Fighter.all.length).to_i

        xid = countd % $xrange
            if countd !=0 && xid == 0
                yid +=1
                if yid > $yrange 
                    yid = $yrange
                end
            end
            

          #realfight( Fighter.all[rand(Fighter.all.length-1)],  Fighter.all[rand(Fighter.all.length-1)])
            countd +=1
    end

    countd = 0
    yid = 0
    xid = 0 

    while yid < $yrange
    xid = countd % $xrange
    if countd !=0 && xid == 0
        yid +=1
        if yid > $yrange 
            yid = $yrange
        end
    end
    
    grabx = (Fighter.all.select do |fighterobj| fighterobj.coordinate.xdim == xid end)
        graby = (grabx.select do |fighterobj| fighterobj.coordinate.ydim == yid end)

            zid = 0
            if graby[zid] 
              #  puts graby[rand(graby.length)].name
                #while graby[zid]
                ###puts graby.length
                    (graby.length).times do 
                        realfight( graby[rand(graby.length)],  graby[rand(graby.length)])
                    end
                    zid += 1
              #  end
            end
            countd += 1
       end
    $start = $start + $step
    holder = Fighter.all.select do |fighter| fighter.status == "Lost" end

        100.times do 
       # Fighter.new("Rock",([fuzzer(countx, $xrange), $xrange].min).to_i,[fuzzer(county, $yrange), $yrange].min, "Alive" )
        end


     # puts Fighter.all.length
        #Fighter.all.delete(holder)
      #  Fighter.all.reject do |object| object.status == "Lost" end
            Fighter.all.delete_if do |fighter| fighter.status =="Lost" end
            #Fighter.all.uniq!
     # puts Fighter.all.length

      #   puts Fighter.all.length
end



def realfight(front, back)
    if front.name == back.name
        back.status = "Lost"
    end
    if front.name == "Paper" && back.name == "Rock"
        back.status = "Lost"
        back.name = "Unknown"
    end
    if front.name == "Rock" && back.name == "Scissors"
        back.status = "Lost"
        back.name = "Unknown"
    end
    if front.name == "Scissors" && back.name == "Paper"
        back.status = "Lost"
        back.name = "Unknown"
    end
    if back.name == "Unknown" 
        back.status = "Lost"
        back.name = "Unknown"
    end
    #puts self.name + opponent.name
    
    if front.name != back.name && (back.status != "Lost" && front.status != "Lost")
    realfight(back, front)
    end
    
    if front == back
        back.status = "Alive"
        front.status = "Alive"
    end
    if back.status == "Lost"
    return false
    else
        return true
    end
    
    end
    


#def initialize(name, upratio = 0.3, downratio = 0.7, position = 3, x =0, y =0, status = "Alive")cd
