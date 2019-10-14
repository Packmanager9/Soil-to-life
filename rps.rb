require "TextGrapher"

$xrange = 100
$yrange =  100
$count = 0
$countclone = 0
$start = 0
$step = 0
$stepstotal = 1000
$dotstotal = ($stepstotal*$step)+1
$pngholder = nil


$red = ChunkyPNG::Color.rgba(255, 0, 0, 255);
$ochre = ChunkyPNG::Color.rgba(255, 255, 0, 255);
$ochrey = ChunkyPNG::Color.rgba(200, 0, 255, 255);
$ochrew = ChunkyPNG::Color.rgba(255, 255, 255, 255);
$green = ChunkyPNG::Color.rgba(0, 255, 0, 255);
$blue = ChunkyPNG::Color.rgba(0, 0, 255, 255);
$black = ChunkyPNG::Color.rgba(0, 0, 0, 255);
$white = ChunkyPNG::Color.rgba(255, 255, 255, 255);




class Fighter

attr_accessor :name, :upratio, :downratio, :position, :coordinate, :status, :x, :y, :clonecount, :all
@@all = []
def initialize(name, x, y, status)
   @coordinate =  (Position.new(x.to_i, y.to_i, true)) 
    @name = name
    @status = status
    @x = x.to_i
    @y = y.to_i
    @@all << self
end
def self.all
    @@all
end
end

xd = ($xrange/4).to_i
xd3 = ($xrange/4).to_i
yd = ($yrange/4).to_i
yd3 = ($yrange/3).to_i
scissors = Fighter.new("Scissors", (2*xd),(1*yd),"Alive")
rock = Fighter.new("Rock", (3*xd),(2*yd3),"Alive")
paper = Fighter.new("Paper", (1*xd), (2*yd3),"Alive")
#hex = Fighter.new("Hex", (2*xd), (2*yd),"Alive") #this adds a  new monster
#puts "before hash"
hashgrid = {}
count = 0 
countx = 0 
county = 0 
while count < ($xrange*$yrange)
            while county <= $yrange

                hashgrid["#{countx},#{county}"] = [countx, county, " "]
                    countx+=1
                    if countx > $xrange
                        countx = 0
                        county +=1
                    end
                count+=1
            end
    end
    



    #puts "after hash"

    #puts "before pos"
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
#puts "after pos"
    def fuzzer (num, range, state)

        num += rand(-1..1)
        if num < 0 
            if state == false
                num=0
                else
                num=0
                end

        end
        if num > range
            num = range
        end
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
                if rand(1002) > 599
                    back.status = "Lost"
                    else
                        front.status = "Lost"
                    end
            end
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
#puts "Proto"
def hugeblock(hashgrid)
    #puts "enter"
count = 0
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
end
#puts "hash to str"

pngarray = ""
count = 0
county = 0
countx = 0
while count < ($xrange*$yrange)-1
    pngarray = pngarray + hashgrid["#{countx},#{county}"][2]
    if count % 1000 == 0
        #puts "step #{count}"
    end

    if pngarray[count] == "g"
        pngx[countx , county] = $black
    elsif pngarray[count] == "R"  
        pngx[countx , county] = $red
    elsif pngarray[count] == "S"  
        pngx[countx , county] =  $blue
    elsif pngarray[count] == "P"  
        pngx[countx , county] = $green
    elsif pngarray[count] == "X"  
        pngx[countx , county] = $ochre
    elsif pngarray[count] == "Y"  
        pngx[countx , county] = $white
        if rand(10) >= 0  
        Fighter.new("Hex", ([fuzzer(countx, $xrange,false), $xrange].min).to_i,[fuzzer(county, $yrange,true), $yrange].min, "Alive")
        end
    elsif pngarray[count] == "W"  
        pngx[countx , county] = $ochrew
    elsif pngarray[count] == "Y"  
        pngx[countx , county] = $white
        Fighter.new("Hex", 0, 0 , 0, [fuzzer(countx, $xrange,false), $xrange].min,[fuzzer(county, $yrange,true), $yrange].min , "Alive", 0)
       else
            pngx[countx , county] = $black
        end
        countx+=1
        if countx > $xrange
            countx = 0
            county +=1
        end
    count += 1
end

#puts "coloring"

pngarray = pngarray.chars 
=begin
if $pngholder != nil
    $pngholder = pngx 
else
    $pngholder = ChunkyPNG::Image.from_file('drawisland.png')
end
=end

$pngholder = pngx 
    #puts Fighter.all.length
Fighter.all.clear

    #puts Fighter.all.length
    zen = 0
    yen = 0 
    while yen < $yrange
        if !(ChunkyPNG::Color.r($pngholder[zen, yen]) == 0 &&  ChunkyPNG::Color.g($pngholder[zen, yen]) == 0 && ChunkyPNG::Color.b($pngholder[zen, yen]) == 0)

     
            if ChunkyPNG::Color.r($pngholder[zen, yen]) == 255 && (ChunkyPNG::Color.g($pngholder[zen, yen]) == 255 && ChunkyPNG::Color.b($pngholder[zen, yen]) == 255)

                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
         graby = (Fighter.all.select do |fighterobj| fighterobj.coordinate.ydim == yid && fighterobj.coordinate.xdim == xid end)
            if !graby.map(&:name).include?("Hex")
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
                Fighter.new("Hex",xid, yid, "Alive" ) 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
         end
         end
     
         if ChunkyPNG::Color.r($pngholder[zen, yen]) == 255 && (ChunkyPNG::Color.g($pngholder[zen, yen]) == 0 && ChunkyPNG::Color.b($pngholder[zen, yen]) == 0)
 
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
         graby = (Fighter.all.select do |fighterobj| fighterobj.coordinate.ydim == yid && fighterobj.coordinate.xdim == xid end)
            if !graby.map(&:name).include?("Rock")
                 Fighter.new("Rock",xid, yid, "Alive" ) 
         end
         end

        if ChunkyPNG::Color.g($pngholder[zen, yen]) == 255  && (ChunkyPNG::Color.r($pngholder[zen, yen]) == 0 && ChunkyPNG::Color.b($pngholder[zen, yen]) == 0)
        
            yid =  [fuzzer(yen, $yrange,true), $yrange].min
            xid =  [fuzzer(zen, $xrange,false), $xrange].min
            graby = (Fighter.all.select do |fighterobj| fighterobj.coordinate.ydim == yid && fighterobj.coordinate.xdim == xid end)
        if !graby.map(&:name).include?("Paper")
             Fighter.new("Paper",xid, yid, "Alive" ) 
     end
        end

        if ChunkyPNG::Color.b($pngholder[zen, yen]) == 255  && (ChunkyPNG::Color.r($pngholder[zen, yen]) == 0 && ChunkyPNG::Color.g($pngholder[zen, yen]) == 0)
            yid =  [fuzzer(yen, $yrange,true), $yrange].min
            xid =  [fuzzer(zen, $xrange,false), $xrange].min
            graby = (Fighter.all.select do |fighterobj| fighterobj.coordinate.ydim == yid && fighterobj.coordinate.xdim == xid end)
        if !graby.map(&:name).include?("Scissors")
             Fighter.new("Scissors",xid, yid, "Alive" ) 
     end
        end

    end
        zen +=1
        if zen == $xrange
            zen = 0
            yen +=1
        end
    end
#puts "after inst"
def saver(pngx)
pngx.save("gifmake4/#{$countp}.png")
#puts $countp

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
        graby = (Fighter.all.select do |fighterobj| fighterobj.coordinate.ydim == yid && fighterobj.coordinate.xdim == xid end)

            zid = 0
                if graby.length > 1
                    (graby.length).times do 
                        realfight( graby[rand(graby.length)],  graby[rand(graby.length)])
                    end
                end
                    zid += 1
            countd += 1
       end
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
 

    if countx >= $xrange
        county += 1
        countx = 0
    end
    countx += 1
end
if tester.length > 1
   # #puts "Yes!"
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
$stepstotal.times do
    hugeblock(hashgrid)
            Fighter.all.delete_if do |fighter| fighter.status =="Lost" end
            
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