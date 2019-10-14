require "TextGrapher"

$range = 4
$xrange = $range
$yrange =  $range
$wrange = $range
$zrange = $range
$count = 0
$countclone = 0
$start = 0
$step = 0
$stepstotal = 1000
$dotstotal = ($stepstotal*$step)+1
$pngholder0 = nil
$pngholder1= nil
$pngholder2 = nil
$pngholder3 = nil


$zero = ChunkyPNG::Color.rgba(255, 100, 100, 255);
$ochre = ChunkyPNG::Color.rgba(255, 255, 0, 255);
$four = ChunkyPNG::Color.rgba(128, 0, 60, 255);
$three = ChunkyPNG::Color.rgba(254, 254, 128, 255);
$ochrey = ChunkyPNG::Color.rgba(200, 0, 255, 255);
$ochrew = ChunkyPNG::Color.rgba(255, 255, 255, 255);
$two = ChunkyPNG::Color.rgba(0, 255, 0, 255);
$one = ChunkyPNG::Color.rgba(0, 0, 255, 255);
$black = ChunkyPNG::Color.rgba(0, 0, 0, 255);
$white = ChunkyPNG::Color.rgba(255, 255, 255, 255);


class Positionz
    attr_accessor  :xdim, :ydim, :status, :char
    def initialize(x, y,  z, w, status)
        @xdim = x
        @ydim = y
        @wdim = w
        @zdim = z
        @status = status 
        @char = " "
    end
end


class Fighterj
attr_accessor :name, :status, :x, :y,  :z, :w, :all
@@all = []
def initialize(name, x, y, z, w,  status)
    @name = name
    @status = status
    @x = x.to_i
    @y = y.to_i
    @z = z.to_i
    @w = w.to_i
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
zd = ($zrange/4).to_i
zd3 = ($zrange/3).to_i
wd = ($wrange/4).to_i
wd3 = ($wrange/3).to_i

dd = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd1 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd2 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd3 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd4 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd5 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd6 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd7 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd8 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd9 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd0 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd10 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd20 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd30 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd40 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd50 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd60 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd70 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd80 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd90 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)
dd00 = Fighterj.new(rand(5), rand($range), rand($range), rand($range), rand($range), 1)



#a = Fighterj.new(0, rand($xrange), rand($yrange),1)
#b = Fighterj.new(1, rand($xrange), rand($yrange),1)
#c = Fighterj.new(2, rand($xrange), rand($yrange),1)
#d = Fighterj.new(3, rand($xrange), rand($yrange),1)
#e = Fighterj.new(4, rand($xrange), rand($yrange),1)
=begin
a1 = Fighterj.new(0, rand($xrange), rand($yrange),1)
b2 = Fighterj.new(1, rand($xrange), rand($yrange),1)
c3 = Fighterj.new(2, rand($xrange), rand($yrange),1)
d4 = Fighterj.new(3, rand($xrange), rand($yrange),1)
e5 = Fighterj.new(4, rand($xrange), rand($yrange),1)
a6 = Fighterj.new(0, rand($xrange), rand($yrange),1)
b7 = Fighterj.new(1, rand($xrange), rand($yrange),1)
c8 = Fighterj.new(2, rand($xrange), rand($yrange),1)
d9 = Fighterj.new(3, rand($xrange), rand($yrange),1)
e0 = Fighterj.new(4, rand($xrange), rand($yrange),1)
=end
#hex = Fighterj.new(3, (2*xd), (2*yd),1) #this adds a  new monster
puts "before hash"
hashgrid = {}
count = 0 
countx = 0 
county = 0 
countz= 0 
countw = 0
while countz < $zrange

                hashgrid["#{countx},#{county},#{countw},#{countz}"] = [countx, county, countw, countz, ""]
                countx+=1
                if countx > $xrange
                    countx = 0
                    county +=1   
                    if county > $yrange
                        county = 0
                        countw +=1  
                        if countw > $wrange
                            countw = 0
                            countz +=1
                        end
                    end
                end
                count+=1
    end
    



    puts "after hash"

    #puts "before pos"
    count = 0 
    countx = 0 
    county = 0 
    countz= 0 
    countw = 0 
    positionarray = []
while countz < $zrange
    positionarray[count] = Positionz.new(hashgrid["#{countx},#{county},#{countw},#{countz}"][0], hashgrid["#{countx},#{county},#{countw},#{countz}"][1], hashgrid["#{countx},#{county},#{countw},#{countz}"][2], hashgrid["#{countx},#{county},#{countw},#{countz}"][3], hashgrid["#{countx},#{county},#{countw},#{countz}"][4])
       
                countx+=1
                if countx > $xrange
                    countx = 0
                    county +=1   
                    if county > $yrange
                        county = 0
                        countw +=1  
                        if countw > $wrange
                            countw = 0
                            countz +=1
                    end
                end
            end
                             count+=1
      
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
        if num >=  range
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
                back.name = "Unknown"
            end
            if front.name == 1 && (back.name == 2 || back.name == 3)
                back.status = 0
                back.name = "Unknown"
            end
            if front.name == 2 && (back.name == 3 || back.name == 4)
                back.status = 0
                back.name = "Unknown"
            end
            if front.name == 3 && (back.name == 4 || back.name == 0)
                back.status = 0
                back.name = "Unknown"
            end
            if front.name == 4 && (back.name == 0 || back.name == 1)
                back.status = 0
                back.name = "Unknown"
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
pngx0 = ChunkyPNG::Image.new(($xrange+1).to_i, ($yrange+1).to_i, ChunkyPNG::Color::TRANSPARENT)
pngx1 = ChunkyPNG::Image.new(($xrange+1).to_i, ($yrange+1).to_i, ChunkyPNG::Color::TRANSPARENT)
pngx2 = ChunkyPNG::Image.new(($xrange+1).to_i, ($yrange+1).to_i, ChunkyPNG::Color::TRANSPARENT)
pngx3 = ChunkyPNG::Image.new(($xrange+1).to_i, ($yrange+1).to_i, ChunkyPNG::Color::TRANSPARENT)
count = 0
Fighterj.all.each do |fighter|
    countx =  fighter.x
    county =  fighter.y
    countw =  fighter.w
    countz =  fighter.z
   #puts hashgrid
    #puts "#{fighter.x},#{fighter.y},#{fighter.w},#{[fighter.z ,($zrange-1)].min}"

    #puts  hashgrid
    #puts "#{fighter.x},#{fighter.y},#{fighter.w},#{fighter.z}"
    hashgrid["#{fighter.x},#{fighter.y},#{fighter.w},#{[fighter.z ,($zrange-1)].min}"][4] = fighter.name
end
#puts "hash to str"

pngarray = []
count = 0 
countx = 0 
county = 0 
countz= 0 
countw = 0
while count < ($xrange*$yrange*$wrange*$zrange)
    pngarray = pngarray <<  hashgrid["#{countx},#{county},#{countw},#{[countz, ($zrange-1)].min}"][4]
   
    if countz == 0
if countw == 0
    if pngarray[count] == 3
        pngx0[countx , county] = $three
    elsif pngarray[count] == 0  
        pngx0[countx , county] = $zero
    elsif pngarray[count] == 1  
        pngx0[countx , county] =  $one
    elsif pngarray[count] == 2  
        pngx0[countx , county] = $two
    elsif pngarray[count] == 4  
        pngx0[countx , county] = $four
    elsif pngarray[count] == 5  
      #  pngx0[countx , county] = $black
    elsif pngarray[count] == 6  
        pngx0[countx , county] = $ochrew
    elsif pngarray[count] == 5  
    #    pngx0[countx , county] = $black
       else
            #pngx0[countx , county] = $black
        end
    elsif countw == 1

        if pngarray[count] == 3
            pngx1[countx , county] = $three
        elsif pngarray[count] == 0  
            pngx1[countx , county] = $zero
        elsif pngarray[count] == 1  
            pngx1[countx , county] =  $one
        elsif pngarray[count] == 2  
            pngx1[countx , county] = $two
        elsif pngarray[count] == 4  
            pngx1[countx , county] = $four
        elsif pngarray[count] == 5  
          #  pngx1[countx , county] = $black
        elsif pngarray[count] == 6  
            pngx1[countx , county] = $ochrew
        elsif pngarray[count] == 5  
        #    pngx1[countx , county] = $black
           else
                #pngx1[countx , county] = $black
            end
    elsif countw == 2

        if pngarray[count] == 3
            pngx2[countx , county] = $three
        elsif pngarray[count] == 0  
            pngx2[countx , county] = $zero
        elsif pngarray[count] == 1  
            pngx2[countx , county] =  $one
        elsif pngarray[count] == 2  
            pngx2[countx , county] = $two
        elsif pngarray[count] == 4  
            pngx2[countx , county] = $four
        elsif pngarray[count] == 5  
          #  pngx0[countx , county] = $black
        elsif pngarray[count] == 6  
            pngx2[countx , county] = $ochrew
        elsif pngarray[count] == 5  
        #    pngx0[countx , county] = $black
           else
                #pngx0[countx , county] = $black
            end
    elsif countw == 3

        if pngarray[count] == 3
            pngx3[countx , county] = $three
        elsif pngarray[count] == 0  
            pngx3[countx , county] = $zero
        elsif pngarray[count] == 1  
            pngx3[countx , county] =  $one
        elsif pngarray[count] == 2  
            pngx3[countx , county] = $two
        elsif pngarray[count] == 4  
            pngx3[countx , county] = $four
        elsif pngarray[count] == 5  
          #  pngx3[countx , county] = $black
        elsif pngarray[count] == 6  
            pngx3[countx , county] = $ochrew
        elsif pngarray[count] == 5  
        #    pngx3[countx , county] = $black
           else
                #pngx3countx , county] = $black
            end
        end
        end
        countx+=1
        if countx > $xrange 
            countx = 0
            county +=1
            if county > $yrange
                county = 0
                countw +=1
                if countw >= $wrange 
                    countw = 0
                    countz +=1
        end
    end
end

    count += 1
end

#puts "coloring"

#pngarray = pngarray.chars 
=begin
if $pngholder0 != nil
    $pngholder0 = pngx0 
else
    $pngholder0 = ChunkyPNG::Image.from_file('drawisland.png')
end
=end

$pngholder0 = pngx0 
$pngholder1 = pngx1
$pngholder2 = pngx2 
$pngholder3 = pngx3 
    #puts Fighterj.all.length
Fighterj.all.clear
    #puts Fighterj.all.length
    xen = 0
    yen = 0 
    wen = 0
    zen = 0 
    while zen < $zrange
        if !(ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 &&  ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)

     
            if ChunkyPNG::Color.r($pngholder0[xen, yen]) == 255 #&& (ChunkyPNG::Color.g($pngholder0[xen, yen]) == 255 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 255)

                yid =  [fuzzer(yen, $yrange,true), $yrange].min
                xid =  [fuzzer(xen, $xrange,false), $xrange].min
                wid =  [fuzzer(wen, $wrange,true), $wrange].min
                zid =  [fuzzer(zen, $zrange,false), $zrange].min
         graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
            if !graby.map(&:name).include?(0)
                Fighterj.new(0,xid, yid, wid, zid,1 ) 
         end
         end
     
         if ChunkyPNG::Color.b($pngholder0[xen, yen]) == 128# && (ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)
 
            yid =  [fuzzer(yen, $yrange,true), $yrange].min
            xid =  [fuzzer(xen, $xrange,false), $xrange].min
            wid =  [fuzzer(wen, $wrange,true), $wrange].min
            zid =  [fuzzer(zen, $zrange,false), $zrange].min
     graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
        if !graby.map(&:name).include?(3)
            Fighterj.new(3,xid, yid, wid, zid,  1 ) 
     end
         end
     
         if ChunkyPNG::Color.r($pngholder0[xen, yen]) == 128
 
            yid =  [fuzzer(yen, $yrange,true), $yrange].min
            xid =  [fuzzer(xen, $xrange,false), $xrange].min
            wid =  [fuzzer(wen, $wrange,true), $wrange].min
            zid =  [fuzzer(zen, $zrange,false), $zrange].min
     graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
        if !graby.map(&:name).include?(4)
            Fighterj.new(4,xid, yid,  wid, zid,1 ) 
     end
         end
     

        if ChunkyPNG::Color.g($pngholder0[xen, yen]) == 255  #&& (ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)
        
            yid =  [fuzzer(yen, $yrange,true), $yrange].min
            xid =  [fuzzer(xen, $xrange,false), $xrange].min
            wid =  [fuzzer(wen, $wrange,true), $wrange].min
            zid =  [fuzzer(zen, $zrange,false), $zrange].min
     graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
        if !graby.map(&:name).include?(2)
            Fighterj.new(2,xid, yid,  wid, zid, 1 ) 
     end
        end

        if ChunkyPNG::Color.b($pngholder0[xen, yen]) == 255 #  && (ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0)
       
            yid =  [fuzzer(yen, $yrange,true), $yrange].min
            xid =  [fuzzer(xen, $xrange,false), $xrange].min
            wid =  [fuzzer(wen, $wrange,true), $wrange].min
            zid =  [fuzzer(zen, $zrange,false), $zrange].min
     graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
        if !graby.map(&:name).include?(1)
            Fighterj.new(1,xid, yid, wid, zid, 1 ) 
     end
        end

        ## secons layer here
        if ChunkyPNG::Color.r($pngholder1[xen, yen]) == 255 #&& (ChunkyPNG::Color.g($pngholder0[xen, yen]) == 255 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 255)

            yid =  [fuzzer(yen, $yrange,true), $yrange].min
            xid =  [fuzzer(xen, $xrange,false), $xrange].min
            wid =  [fuzzer(wen, $wrange,true), $wrange].min
            zid =  [fuzzer(zen, $zrange,false), $zrange].min
     graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
        if !graby.map(&:name).include?(0)
            Fighterj.new(0,xid, yid, wid, zid,1 ) 
     end
     end
 
     if ChunkyPNG::Color.b($pngholder1[xen, yen]) == 128# && (ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)

        yid =  [fuzzer(yen, $yrange,true), $yrange].min
        xid =  [fuzzer(xen, $xrange,false), $xrange].min
        wid =  [fuzzer(wen, $wrange,true), $wrange].min
        zid =  [fuzzer(zen, $zrange,false), $zrange].min
 graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
    if !graby.map(&:name).include?(3)
        Fighterj.new(3,xid, yid, wid, zid,  1 ) 
 end
     end
 
     if ChunkyPNG::Color.r($pngholder1[xen, yen]) == 128

        yid =  [fuzzer(yen, $yrange,true), $yrange].min
        xid =  [fuzzer(xen, $xrange,false), $xrange].min
        wid =  [fuzzer(wen, $wrange,true), $wrange].min
        zid =  [fuzzer(zen, $zrange,false), $zrange].min
 graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
    if !graby.map(&:name).include?(4)
        Fighterj.new(4,xid, yid,  wid, zid,1 ) 
 end
     end
 

    if ChunkyPNG::Color.g($pngholder1[xen, yen]) == 255  #&& (ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)
    
        yid =  [fuzzer(yen, $yrange,true), $yrange].min
        xid =  [fuzzer(xen, $xrange,false), $xrange].min
        wid =  [fuzzer(wen, $wrange,true), $wrange].min
        zid =  [fuzzer(zen, $zrange,false), $zrange].min
 graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
    if !graby.map(&:name).include?(2)
        Fighterj.new(2,xid, yid,  wid, zid, 1 ) 
 end
    end

    if ChunkyPNG::Color.b($pngholder1[xen, yen]) == 255 #  && (ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0)
   
        yid =  [fuzzer(yen, $yrange,true), $yrange].min
        xid =  [fuzzer(xen, $xrange,false), $xrange].min
        wid =  [fuzzer(wen, $wrange,true), $wrange].min
        zid =  [fuzzer(zen, $zrange,false), $zrange].min
 graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
    if !graby.map(&:name).include?(1)
        Fighterj.new(1,xid, yid, wid, zid, 1 ) 
 end
    end
    ## third layer here
    if ChunkyPNG::Color.r($pngholder2[xen, yen]) == 255 #&& (ChunkyPNG::Color.g($pngholder0[xen, yen]) == 255 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 255)

        yid =  [fuzzer(yen, $yrange,true), $yrange].min
        xid =  [fuzzer(xen, $xrange,false), $xrange].min
        wid =  [fuzzer(wen, $wrange,true), $wrange].min
        zid =  [fuzzer(zen, $zrange,false), $zrange].min
 graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
    if !graby.map(&:name).include?(0)
        Fighterj.new(0,xid, yid, wid, zid,1 ) 
 end
 end

 if ChunkyPNG::Color.b($pngholder2[xen, yen]) == 128# && (ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)

    yid =  [fuzzer(yen, $yrange,true), $yrange].min
    xid =  [fuzzer(xen, $xrange,false), $xrange].min
    wid =  [fuzzer(wen, $wrange,true), $wrange].min
    zid =  [fuzzer(zen, $zrange,false), $zrange].min
graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
if !graby.map(&:name).include?(3)
    Fighterj.new(3,xid, yid, wid, zid,  1 ) 
end
 end

 if ChunkyPNG::Color.r($pngholder2[xen, yen]) == 128

    yid =  [fuzzer(yen, $yrange,true), $yrange].min
    xid =  [fuzzer(xen, $xrange,false), $xrange].min
    wid =  [fuzzer(wen, $wrange,true), $wrange].min
    zid =  [fuzzer(zen, $zrange,false), $zrange].min
graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
if !graby.map(&:name).include?(4)
    Fighterj.new(4,xid, yid,  wid, zid,1 ) 
end
 end


if ChunkyPNG::Color.g($pngholder2[xen, yen]) == 255  #&& (ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)

    yid =  [fuzzer(yen, $yrange,true), $yrange].min
    xid =  [fuzzer(xen, $xrange,false), $xrange].min
    wid =  [fuzzer(wen, $wrange,true), $wrange].min
    zid =  [fuzzer(zen, $zrange,false), $zrange].min
graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
if !graby.map(&:name).include?(2)
    Fighterj.new(2,xid, yid,  wid, zid, 1 ) 
end
end

if ChunkyPNG::Color.b($pngholder2[xen, yen]) == 255 #  && (ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0)

    yid =  [fuzzer(yen, $yrange,true), $yrange].min
    xid =  [fuzzer(xen, $xrange,false), $xrange].min
    wid =  [fuzzer(wen, $wrange,true), $wrange].min
    zid =  [fuzzer(zen, $zrange,false), $zrange].min
graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
if !graby.map(&:name).include?(1)
    Fighterj.new(1,xid, yid, wid, zid, 1 ) 
end
end

    ## fourth layer here
    if ChunkyPNG::Color.r($pngholder3[xen, yen]) == 255 #&& (ChunkyPNG::Color.g($pngholder0[xen, yen]) == 255 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 255)

        yid =  [fuzzer(yen, $yrange,true), $yrange].min
        xid =  [fuzzer(xen, $xrange,false), $xrange].min
        wid =  [fuzzer(wen, $wrange,true), $wrange].min
        zid =  [fuzzer(zen, $zrange,false), $zrange].min
 graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
    if !graby.map(&:name).include?(0)
        Fighterj.new(0,xid, yid, wid, zid,1 ) 
 end
 end

 if ChunkyPNG::Color.b($pngholder3[xen, yen]) == 128# && (ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)

    yid =  [fuzzer(yen, $yrange,true), $yrange].min
    xid =  [fuzzer(xen, $xrange,false), $xrange].min
    wid =  [fuzzer(wen, $wrange,true), $wrange].min
    zid =  [fuzzer(zen, $zrange,false), $zrange].min
graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
if !graby.map(&:name).include?(3)
    Fighterj.new(3,xid, yid, wid, zid,  1 ) 
end
 end

 if ChunkyPNG::Color.r($pngholder3[xen, yen]) == 128

    yid =  [fuzzer(yen, $yrange,true), $yrange].min
    xid =  [fuzzer(xen, $xrange,false), $xrange].min
    wid =  [fuzzer(wen, $wrange,true), $wrange].min
    zid =  [fuzzer(zen, $zrange,false), $zrange].min
graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
if !graby.map(&:name).include?(4)
    Fighterj.new(4,xid, yid,  wid, zid,1 ) 
end
 end


if ChunkyPNG::Color.g($pngholder3[xen, yen]) == 255  #&& (ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.b($pngholder0[xen, yen]) == 0)

    yid =  [fuzzer(yen, $yrange,true), $yrange].min
    xid =  [fuzzer(xen, $xrange,false), $xrange].min
    wid =  [fuzzer(wen, $wrange,true), $wrange].min
    zid =  [fuzzer(zen, $zrange,false), $zrange].min
graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
if !graby.map(&:name).include?(2)
    Fighterj.new(2,xid, yid,  wid, zid, 1 ) 
end
end

if ChunkyPNG::Color.b($pngholder3[xen, yen]) == 255 #  && (ChunkyPNG::Color.r($pngholder0[xen, yen]) == 0 && ChunkyPNG::Color.g($pngholder0[xen, yen]) == 0)

    yid =  [fuzzer(yen, $yrange,true), $yrange].min
    xid =  [fuzzer(xen, $xrange,false), $xrange].min
    wid =  [fuzzer(wen, $wrange,true), $wrange].min
    zid =  [fuzzer(zen, $zrange,false), $zrange].min
graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
if !graby.map(&:name).include?(1)
    Fighterj.new(1,xid, yid, wid, zid, 1 ) 
end
end

    end
        xen +=1
        if xen == $xrange
            xen = 0
            yen +=1
            if yen == $yrange
                yen = 0
                wen +=1
                if wen == $wrange
                    wen = 0
                    zen +=1
                end
            end
        end
    end
#puts "after inst"
def saver(pngx0, pngx1, pngx2, pngx3)
    pngx0.save("gifmake6/#{$countp}.png")
    pngx1.save("gifmake7/#{$countp}.png")
        pngx2.save("gifmake8/#{$countp}.png")
        pngx3.save("gifmake9/#{$countp}.png")
puts $countp

    countd = 0
    yid = 0
    xid = 0 
    wid = 0
    zid = 0

    while countd < ($xrange**4)
    
        graby = (Fighterj.all.select do |fighterobj| fighterobj.y == yid && fighterobj.x == xid  && fighterobj.w == wid && fighterobj.z == zid end)
                if graby.length > 1
                    (graby.length).times do 
                        realfight( graby[rand(graby.length)],  graby[rand(graby.length)])
                    end
                end
                    zid += 1
            countd += 1
       end
       xid += 1
    if xid >= $xrange
        xid = 0
        yid +=1
        if yid >=  $yrange 
            yid = 0
            wid += 1
            if wid >= $wrange
                wid = 0
                zid +=1
            end
        end
    end
end
$countp +=1
saver(pngx0, pngx1, pngx2, pngx3)

count += 1


end



count = 0


countx = 0
county = 0
count = 0
while county < $yrange
    tester = Fighterj.all.select do |fighter| ((fighter.x == countx)&&(fighter.y== county)) end 
 

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
            testcase.status = 0
            testcase.name = "Unknown"
        end
        opponentcase.fight(testcase) 
    end
end
end 
$stepstotal.times do
    hugeblock(hashgrid)
            Fighterj.all.delete_if do |fighter| fighter.status ==0 end
            
end



def realfight(front, back)
    if front.name == back.name
        back.status = 0
    end
    if front.name == 2 && back.name == 0
        back.status = 0
        back.name = "Unknown"
    end
    if front.name == 0 && back.name == 1
        back.status = 0
        back.name = "Unknown"
    end
    if front.name == 1 && back.name == 2
        back.status = 0
        back.name = "Unknown"
    end
    if back.name == "Unknown" 
        back.status = 0
        back.name = "Unknown"
    end
    if front.name != back.name && (back.status != 0 && front.status != 0)
    realfight(back, front)
    end  
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