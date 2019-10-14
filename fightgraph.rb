require "Chunky_Png"

$xrange = 49
$yrange =  49
$count = 0
$countclone = 0
$start = 0
$step = 0
$stepstotal = 60000
$dotstotal = ($stepstotal*$step)+1
$pngholder = nil

$zeromax = 0
$onemax =  0
$twomax = 0
$threemax = 0
$fourmax = 0
$allmax = 0 

$g0array =[]
$g1array =[]
$g2array =[]
$g3array =[]
$g4array =[]


$zero = ChunkyPNG::Color.rgba(255, 0, 0, 255);
$ochre = ChunkyPNG::Color.rgba(255, 255, 0, 255);
$four = ChunkyPNG::Color.rgba(0, 0, 255, 255);
$three = ChunkyPNG::Color.rgba(254, 254, 128, 255);
$ochrey = ChunkyPNG::Color.rgba(200, 0, 255, 255);
$ochrew = ChunkyPNG::Color.rgba(255, 255, 255, 255);
$two = ChunkyPNG::Color.rgba(0, 255, 0, 255);
$one = ChunkyPNG::Color.rgba(128, 0, 200, 255);
$black = ChunkyPNG::Color.rgba(0, 0, 0, 255);
$white = ChunkyPNG::Color.rgba(255, 255, 255, 255);
$wall = ChunkyPNG::Color.rgba(50, 50, 100, 255);

require "Chunky_Png"

class Position # class that contains the x and y positions of a point and what character to print at that position
    attr_accessor  :xdim, :ydim, :status, :char
    def initialize(x, y, status)
        @xdim = x
        @ydim = y
        @status = status # this is rather redundant, but it can be used to filter what prints out if needed. Line 76 can be made conditional such that it checks if the position.status is true or false before printing a char, or a space respectively.
        @char = " "
    end
    def maketrue 
        @char = "X"
        @status = true
    end
    def makefalse 
        @status = false
    end
    def makenil
        @status = nil
    end
    def makeline # makes the character a "-" for any position, and sets it to print
        @char = "-"
        @status = true
    end
    def makeinput(input)  ## can be used to make a curve have any character except "|" but line 71  will need to be commented out of this code, or can be used as the characer choice
        @char = "#{input}"
        @status = true
    end
end
class Input_set # a class that contains the input prefrences and an array of position objects, which are required for the output to be created. The graphit function takes a block of the form |x| (x**2).to_i prints the x value positive half of a parabola 
    attr_accessor  :bigpointmode, :positionset, :xrange, :yrange, :trackline_height, :filename, :slopemode, :xstart, :ystart, :xstep, :ystep
        def initialize(positions, xrange, yrange, trackline_height = (xrange/2).to_i, xstep = 1, ystep = 1, xstart = 0, ystart = 0, filename ="graph", slopemode = false)
            @filename = filename
            @xrange = xrange + xstart
            @yrange = yrange + ystart
            @trackline_height = trackline_height
            @xstart = xstart
            @ystart = ystart
            @xstep = xstep
            @ystep = ystep
            if positions[0] == nil
                countx = xstart
                county = ystart
                count = 0
                    while county < yrange+ystart
                        positions[count] = Position.new((countx), (county), false)
                            countx+=xstep
                            if countx >= xrange +xstart
                                countx = 0
                                county +=ystep
                            end
                        count+=1
                    end
            end
            @slopemode = slopemode #for a future implementation of a closer representation of the graph
            @positionset = []
            @positionset = positions
            @bigpointmode = false
        end
        def bigpointmode
            @bigpointmode = true
        end
        def graphit(filename = self.filename)
             def xeq(xdim)
                xdim
            end
            def yeq(ydim)
                 ydim
            end
            @filename = filename
            count = 0
            str = "|"
            while count < self.positionset.length
                    if xeq(yield(self.positionset[count].xdim)) == yeq(self.positionset[count].ydim)  ## the block here determines the graph that is printed. 
                        self.positionset[count].makeinput("#")  ## the character "#" here is hardcoded for visability, but can be changed at will, and if commented out, the position objects can hold a character with the makeinput method, allowing for arbitrary printouts and multiple graphs
                    end 
                       if  self.trackline_height == self.positionset[count].ydim  ## this adds a straight line at the hight of the trackline parameter if it is within the range. It can be harmless deleted or duplicated and modified to produce multiple graphs
                        self.positionset[count].makeinput("-")
                    end  
                    str = str+self.positionset[count].char       
                if (count+@xstart) % (self.xrange) == 0   && count != 0  ## this conditional evaluation determines when to break the graph up by row, if this evaluates incorrectly the graph will be warped or unreadable
                    if self.slopemode == true

                    else
                    str =  str +"|\n|"            ## do not graph with | because the lines are split by this character, or if required, change the spilt and this line to a different character but consistent in both places to maintain graph structure
                    end
                end
                    count+=1
            end
            ## the block below orients the graph in the standard layout, as it is written upsidedown and backwards
            strray = []
            strray = str.split("|")
            count = 0
            closedreverse = []
            while count < strray.length
                closedreverse << strray[count].reverse
                count +=1
            end
            str = ""
            count = 0
            while count < closedreverse.length
            str = str +closedreverse[count]
            count +=1
            end

             if self.slopemode == true ## requires the ChunkyPNG gem 
                        red = ChunkyPNG::Color.rgba(255, 0, 0, 255);
                        green = ChunkyPNG::Color.rgba(0, 255, 0, 255);
                        blue = ChunkyPNG::Color.rgba(0, 0, 255, 255);
                        black = ChunkyPNG::Color.rgba(0, 0, 0, 255);
                        white = ChunkyPNG::Color.rgba(255, 255, 255, 255);
                        pngx = ChunkyPNG::Image.new((self.xrange/self.xstep).to_i, (self.yrange/self.ystep).to_i, ChunkyPNG::Color::BLACK)
            # You can now set the color of pixels in this 20x20 PNG like so:

                    pngarray = []
                    pngarray = str.chars
                    count = 0
                        while pngarray[count] && self.positionset[count] != nil 
                            if pngarray[count] == " "  
                           # pngx[(self.positionset[count].xdim), (self.positionset[count].ydim).to_i] = white
                        elsif pngarray[count] == "4"  
                            pngx[(self.positionset[count].xdim), (self.positionset[count].ydim).to_i] = $zero
                        elsif pngarray[count] == "3"  
                            pngx[(self.positionset[count].xdim), (self.positionset[count].ydim).to_i] = $one
                        elsif pngarray[count] == "2"  
                            pngx[(self.positionset[count].xdim), (self.positionset[count].ydim).to_i] = $two
                        elsif pngarray[count] == "1"  
                            pngx[(self.positionset[count].xdim), (self.positionset[count].ydim).to_i] = $three
                        elsif pngarray[count] == "0"  
                            pngx[(self.positionset[count].xdim), (self.positionset[count].ydim).to_i] = $four
                        else

                            #pngx[(self.positionset[count].xdim), (self.positionset[count].ydim).to_i] = black
                    
                            end
                            count +=1
                        end
                        pngx.flip_horizontally!
                    pngx.save("#{self.filename}.png")
            else
                    IO.write("#{self.filename}.txt", str.reverse)   ## this is the output writer you can change the file type if you can think of a way it benefits you
            end 
                    ## the minimum initialization set to create a graph is roughly object = Input_set.new(positions_to_graph, xrange, yrange)  followed by graph_object.graphit and a yield block if needed to create the curve, if the positions hold the curve, simply yield the parameter with a .to_i on it for the conditionals on the printout method.
            end
end



class Fighter

attr_accessor :name, :status, :x, :y,  :all
@@all = []
def initialize(name, x, y, status)
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
xd3 = ($xrange/3).to_i
yd = ($yrange/4).to_i
yd3 = ($yrange/3).to_i
yd10 = ($yrange/10).to_i
a = Fighter.new(0, xd3, yd,1)
b = Fighter.new(1, (2*xd3), (yd),1)
c = Fighter.new(2, (3*xd), (2*yd),1)
d = Fighter.new(3, (2*xd), (yd+yd3+yd10),1)
e = Fighter.new(4, (xd),  (2*yd),1)
#wall = Fighter.new(5, $xrange+1, $yrange+1, 1)
# zero is graphed blue, should be red, 1 is graphed yellow, should be purple, two is green, should be green,  three is purple should bey yelllow,  four is red should be blue

=begin
a1a = Fighter.new(0, rand($xrange), rand($yrange),1)
a1s = Fighter.new(1, rand($xrange), rand($yrange),1)
a1d = Fighter.new(2, rand($xrange), rand($yrange),1)
a1f = Fighter.new(3, rand($xrange), rand($yrange),1)
a1g = Fighter.new(4, rand($xrange), rand($yrange),1)
a1h = Fighter.new(0, rand($xrange), rand($yrange),1)
a1i = Fighter.new(1, rand($xrange), rand($yrange),1)
a1j = Fighter.new(2, rand($xrange), rand($yrange),1)
a1k = Fighter.new(3, rand($xrange), rand($yrange),1)
a1dk = Fighter.new(4, rand($xrange), rand($yrange),1)
b2 = Fighter.new(1, rand($xrange), rand($yrange),1)
c3 = Fighter.new(2, rand($xrange), rand($yrange),1)
d4 = Fighter.new(3, rand($xrange), rand($yrange),1)
e5 = Fighter.new(4, rand($xrange), rand($yrange),1)
a6 = Fighter.new(0, rand($xrange), rand($yrange),1)
b7 = Fighter.new(1, rand($xrange), rand($yrange),1)
c8 = Fighter.new(2, rand($xrange), rand($yrange),1)
d9 = Fighter.new(3, rand($xrange), rand($yrange),1)
e0 = Fighter.new(4, rand($xrange), rand($yrange),1)
=end
#hex = Fighter.new(3, (2*xd), (2*yd),1) #this adds a  new monster
#puts "before hash"
hashgrid = {}
count = 0 
countx = 0 
county = 0 
while count < ($xrange*$yrange)
            while county < $yrange*2

                hashgrid["#{countx},#{county}"] = [countx, county, " "]
                    countx+=1
                    if countx >= $xrange*2
                        countx = 0
                        county +=1
                    end
                count+=1
            end
    end
    



    #puts "after hash"

    #puts "before pos"
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
        if num >= range
            num = range
        end
        num
        end

        def fuzzer_i (num, range, state)

            num += rand(-2..2)
            if num < 0 
                if state == false
                    num=0
                    else
                    num=0
                    end
    
            end
            if num >= range
                num = range
            end
            num
            end
    

        def realfight(front, back)
            if front.name == back.name
                back.status = 0
            end
            if front.name == 0 && (back.name == 1 || back.name == 2)
                back.status = 0
            end
            if front.name == 1 && (back.name == 2 || back.name == 3)
                back.status = 0
            end
            if front.name == 2 && (back.name == 3 || back.name == 4)
                back.status = 0
            end
            if front.name == 3 && (back.name == 4 || back.name == 0)
                back.status = 0
            end
            if front.name == 4 && (back.name == 0 || back.name == 1)
                back.status = 0
            end
            if front.name == 5 
                back.status = 0
            end
            if back.name == 5 
                front.status = 0
            end
           # if back.name == "Unknown" 
            #    back.status = 0
            #    back.name = "Unknown"
            #end

            
            if front == back
                back.status = 1
                front.status = 1
            end
            if back.status == 0
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


pngx = ChunkyPNG::Image.new(($xrange), ($yrange), ChunkyPNG::Color::TRANSPARENT)

count = 0
Fighter.all.each do |fighter|
    x =  fighter.x
    y =  fighter.y
#puts x
#puts y 
        hashgrid["#{x},#{y}"][2] = fighter.name
end
#puts "hash to str"

pngarray = []
count = 0
county = 0
countx = 0
while count < ($xrange*$yrange)
    pngarray = pngarray << hashgrid["#{countx},#{county}"][2]
   

    if pngarray[count] == 3
        pngx[countx , county] = $three
    elsif pngarray[count] == 0  
        pngx[countx , county] = $zero
    elsif pngarray[count] == 1  
        pngx[countx , county] =  $one
    elsif pngarray[count] == 2  
        pngx[countx , county] = $two
    elsif pngarray[count] == 3 
        pngx[countx , county] = $three
    elsif pngarray[count] == 4  
        pngx[countx , county] = $four
    elsif pngarray[count] == 5  
        pngx[countx , county] = $wall
        
    elsif pngarray[count] == 6  
        pngx[countx , county] = $ochrew
    elsif pngarray[count] == 5  
        pngx[countx , county] = $wall
       else
            pngx[countx , county] = $black
        end
        countx+=1
        if countx >= $xrange
            countx = 0
            county +=1
        end
    count += 1
end

#puts "coloring"

#pngarray = pngarray.chars 
$pngholder = pngx 
#if $pngholder == nil
 #   $pngholder = ChunkyPNG::Image.from_file('testseed.png')
#else
#    $pngholder = pngx 
#end


#$pngholder = pngx 
    #puts Fighter.all.length
Fighter.all.clear
    #puts Fighter.all.length
    zen = 0
    yen = 0 
    while yen < $yrange
        if !(ChunkyPNG::Color.r($pngholder[zen, yen]) == 0 &&  ChunkyPNG::Color.g($pngholder[zen, yen]) == 0 && ChunkyPNG::Color.b($pngholder[zen, yen]) == 0)

     
            if ChunkyPNG::Color.r($pngholder[zen, yen]) == 255
 
                if rand(50) == 5
                    yid =  [fuzzer(yen, $yrange,true), $yrange].min
                    xid =  [fuzzer(zen, $xrange,false), $xrange].min
                else
                    yid = yen
                    xid = zen
                end
         graby = (Fighter.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid end)
            if !graby.map(&:name).include?(0)
                 Fighter.new(0,xid, yid, 1 ) 
            end
         end
     
         if ChunkyPNG::Color.b($pngholder[zen, yen]) == 128# && (ChunkyPNG::Color.g($pngholder[zen, yen]) == 0 && ChunkyPNG::Color.b($pngholder[zen, yen]) == 0)
 
            if rand(50) == 5
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
            else
                yid = yen
                xid = zen
            end
         graby = (Fighter.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid end)
            if !graby.map(&:name).include?(3)
                 Fighter.new(3,xid, yid, 1 ) 
         end
         end
     
         if ChunkyPNG::Color.b($pngholder[zen, yen]) == 255
 
            if rand(50) == 5
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
            else
                yid = yen
                xid = zen
            end
         graby = (Fighter.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid end)
            if !graby.map(&:name).include?(4)
                 Fighter.new(4,xid, yid, 1 ) 
         end
         end
     

      
         if ChunkyPNG::Color.g($pngholder[zen, yen]) == 255
 
            if rand(50) == 5
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
            else
                yid = yen
                xid = zen
            end
     graby = (Fighter.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid end)
        if !graby.map(&:name).include?(2)
             Fighter.new(2,xid, yid, 1 ) 
     end
     end

      
 

        if ChunkyPNG::Color.r($pngholder[zen, yen]) == 128 #  && (ChunkyPNG::Color.r($pngholder[zen, yen]) == 0 && ChunkyPNG::Color.g($pngholder[zen, yen]) == 0)

            if rand(50) == 5
                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(zen, $xrange,false), $xrange].min
            else
                yid = yen
                xid = zen
            end
            graby = (Fighter.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid end)
        if !graby.map(&:name).include?(1)
             Fighter.new(1,xid, yid, 1 ) 
        end
    end

    if ChunkyPNG::Color.g($pngholder[zen, yen]) == 50 && ChunkyPNG::Color.r($pngholder[zen, yen]) == 50 && ChunkyPNG::Color.b($pngholder[zen, yen]) == 100
        Fighter.new(5,zen, yen, 1 ) 
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
pngx.save("gifmake24/#{$countp}.png")

pngx.save("/Users/coleditzler/Desktop/sinatra-shotgun-server-seattle-web-091619/public/x.png")
pngx.save("/Users/coleditzler/Desktop/sinatra-shotgun-server-seattle-web-091619/public/#{$countp}.png")
puts $countp

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
        graby = (Fighter.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid end)

            zid = 0
                if graby.length > 1
                    (graby.length).times do 
                        g = 0
                        f = 0
                        while g == f
                        g = rand(graby.length)
                        f= rand(graby.length)
                        end
                            g = graby[g]
                            f = graby[f]
                            if g !=f && f.name != g.name && 
                        realfight( g, f)
                     
                        end
                    end
            end
            wallprescence = graby.find do |wallfind|  wallfind.name == 5 end
                if wallprescence != nil
                        Fighter.new(5, xid, yid, 1)
                        pngx[xid,yid] = $wall
                end
                    zid += 1
            countd += 1
       end
end
$countp +=1
saver(pngx)

count += 1
end












$stepstotal.times do
    hugeblock(hashgrid)
            Fighter.all.delete_if do |fighter| fighter.status ==0 end
                g0 =   Fighter.all.select do |fighter|  fighter.name ==0 end
                    g1 =   Fighter.all.select do |fighter|  fighter.name == 1 end
                        g2 =   Fighter.all.select do |fighter|  fighter.name == 2 end
                            g3 =   Fighter.all.select do |fighter|  fighter.name == 3 end
                                g4 =   Fighter.all.select do |fighter|  fighter.name == 4 end
# (100*(g0.length.to_f/($yrange*$xrange))).to_i


                                    gx0 = Position.new($countp, g0.length, true)
                                    gx0.makeinput("0")
                                    gx1 = Position.new($countp, g1.length ,true)
                                    gx1.makeinput("1")
                                    gx2 = Position.new($countp, g2.length, true)
                                    gx2.makeinput("2")
                                    gx3 = Position.new($countp,g3.length, true)
                                    gx3.makeinput("3")
                                    gx4 = Position.new($countp ,g4.length, true)
                                    gx4.makeinput("4")

                                    if $zeromax < g0.length
                                        $zeromax = g0.length
                                    end


                                    if $onemax < g1.length
                                        $onemax = g1.length
                                    end


                                    if $twomax < g2.length
                                        $twomax = g2.length
                                    end


                                    if $threemax < g3.length
                                        $threemax = g3.length
                                    end


                                    if $fourmax < g4.length
                                        $fourmax = g4.length
                                    end



                                    $allmax = [$onemax, $zeromax, $twomax, $threemax, $fourmax].max
                                                                                                                                                                                    


$g0array << gx0
$g0array << gx1
$g0array << gx2
$g0array << gx3
$g0array << gx4 
#([101, (1+($allmax.to_f*(100.to_f/($xrange*$yrange)))).to_i].min)
gy0 = Input_set.new($g0array,  ($countp+1), ($allmax+1),0, 1, 1, 0, 0, "Rockgraph",true)
gy0.graphit("/Users/coleditzler/Desktop/sinatra-shotgun-server-seattle-web-091619/public/graph") do |xdim|  
    xdim.to_i  ## always include a ".to_i" for the graph to print correctly. To print values between whole numbers multiply the curve and chart as if the multiple was 1 
    xdim  ## block must return the value being manipulated implicitly as explicit return will cause the program to end early
end

end

