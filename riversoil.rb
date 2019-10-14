require "Chunky_png"

$xrange = 255
$yrange = 255
$steps = 100000
$eaten = 0



class Weather 
    attr_accessor :name, :status, :x, :y,  :r, :g, :b, :a, :energy, :all
    @@all = []
    def initialize(name, x, y, status, r, g, b, a, energy)
        @name = name
        @status = status
        @x = x.to_i
        @y = y.to_i
        @r = r
        @g = g
        @b = b
        @energy = energy
        @a = a
        @@all << self
    end

    def self.all
        @@all
    end
end

class Fighter

    attr_accessor :name, :status, :x, :y,  :r, :g, :b,  :all
    @@all = []
    def initialize(name, x, y, status, r, g, b)
        @name = name
        @status = status
        @x = x.to_i
        @y = y.to_i
        @r = r
        @g = g
        @b = b
        @@all << self
    end
    def self.all
        @@all
    end
    end


    class Terrain <  Fighter

        attr_accessor :type, :depth, :energy,  :all
        @@all = []
        def initialize(name, x, y,  status, r, g, b, type, depth, energy)
            super(name, x, y, status, r, g, b)
            @type = type
            @energy = energy
            @depth = depth
            @@all << self
        end
        def self.all
            @@all
        end
        end


        class Plant <  Fighter

            attr_accessor :type, :depth, :energy,  :growthrate,  :traits, :all
            @@all = []
            def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, traits = [0 , 0 , 0])
                super(name, x, y, status, r, g, b)
                @type = type
                @traits = traits
                @energy = energy
                @depth = depth
                @growthrate = growthrate
                @@all << self
            end
            def self.all
                @@all
            end
            def self.avg_energy
                x = 0
                Plant.all.each do |plant| x += plant.energy end
                    avg = (x.to_f/Plant.all.length)
                    avg
            end
            end
            

            class Herbivore <  Fighter
    
                attr_accessor :type, :depth, :energy, :growthrate, :traits, :all
                @@all = []
                def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, traits)
                    super(name, x, y, status, r, g, b)
                    @type = type
                    @energy = energy
                    @depth = depth
                    @growthrate = growthrate
                    @traits = traits
                    @@all << self
                end
                def self.all
                    @@all
                end
                end
            

                class Predator <  Fighter
        
                    attr_accessor :type, :depth, :energy, :growthrate, :traits, :all
                    @@all = []
                    def initialize(name, x, y, status,  r, g, b, type, depth, energy, growthrate, traits = [])
                        super(name, x, y, status, r, g, b)
                        @type = type
                        @energy = energy
                        @depth = depth
                        @growthrate = growthrate
                        @traits = traits
                        @@all << self
                    end
                    def self.all
                        @@all
                    end
                    end
            
    #0 == dust 
    #1 = active
    #0 = soil


def belllcurve(y)
    x = 0
    y.times do
        x += rand(0..1)
    end
    x
end

  #  dustcolor = ChunkyPNG::Color.rgba(162, 116, 78, 255)
  #  dust = Terrain.new(0, 5, 5, 1, 162, 116, 78,  "path", 0, 10)
   # grass = Plant.new(0, 4, 4, 1, rand(50), (rand(122)+134), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+1))

####puts dust
####puts grass


#$mongoose = Predator.new(101, rand($xrange) ,rand($yrange), 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(10000)+10), (belllcurve(1)+1))
#$Python = Predator.new(102, rand($xrange), rand($yrange),  1, 255, (rand(20)+20), rand(100), "pred", 0, (belllcurve(20000)+100), (belllcurve(7)+7))
#$tiger = Predator.new(103, 10, 10, 1, 255, 0, 0, "pred", 0, (belllcurve(50000)+200), (belllcurve(10)+10))



def swim(water, life)

        if water.name == -9 && life.name >= 0
         #   ####puts "fuck"
        if water.name == -9  && rand(3) == 0 && (rand(water.depth) != 0)
            if life.traits[1] == 0
                water.energy += (life.energy)
                Fighter.all.delete(life)
                life = nil
            end
        end
    end
    GC.start(full_mark: true, immediate_sweep: true);
end

def populate


    predator_count = 0 
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
                terr = provideterrainbasic(0, 8, x, y)
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            if rand(1000) == 1
                if predator_count < 20
                terr = predator_generator(0, 3, x, y)
                predator_count += 1
                end
            end
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
                terr = provideterrainbasic(0, 8, x, y)
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end
    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            if rand(19) == (x%20) 
              #  terr = provideplants(0, 3, x, y, -4)  ##busted
            end
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end

    y = 0
    x = 0
    ($yrange+1).times do
        ($xrange+1).times do
            if rand(200) == (x%20) 
                terr = provideanimals(0, 3, x, y)
            end
                #pngx[x,y] = ChunkyPNG::Color.rgba(terr.r, terr.g, terr.b, 255)
            x+=1
        end
        x  = 0
        y+=1
    end

end
def provideterrain(a, b, x, y)
    # dustcolor = ChunkyPNG::Color.rgba(rand(130..170), rand(80..130), rand(50..100), 255)
 #    dust = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, 1)
 #    clay = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, 10)
 #    dirt = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, 25)
  #   soil = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, 50)
  #   earth = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, 100)
  #   mud = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, 200)
  #   loam = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, 500)
   # rock = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 160,  "path", 0, 0)
 
 #    dust = Terrain.new(-1, x, y, 1, 255, 255, 255,  "path", 0, 1)
 #   clay = Terrain.new(-2, x, y, 1, 0, 255, 255,  "path", 0, 10)
 #   dirt = Terrain.new(-3, x, y, 1, 255, 0, 255,  "path", 0, 25)
 #   soil = Terrain.new(-4, x, y, 1, 255, 255, 0,  "path", 0, 50)
 #   earth = Terrain.new(-5, x, y, 1, 0, 0, 255,  "path", 0, 100)
 #    mud = Terrain.new(-6, x, y, 1, 0, 255, 0,  "path", 0, 200)
    # loam = Terrain.new(-7, x, y, 1, 255, 0, 0,  "path", 0, 500)
  #  rock = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 160,  "path", 0, 0)
 
     c = rand(a..b)
    case c
     when 0
         d = dust
    when 1
        d = clay
    when 2
        d = dirt
    when 3
        d = mud
    when 4
        d = earth
    when 5
        d = soil
    when 6
        d = loam
     else 
         d = mud
    end
 ####puts "#{d.r},#{d.g},#{d.b}, #{c}"
 return d
 end
 

 def provideterrainbasic(lowestsoil, highestsoil, x, y)
    # dustcolor = ChunkyPNG::Color.rgba(rand(130..170), rand(80..130), rand(50..100), 255)
    # dust = Terrain.new(0, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, 1)
    # dirt = Terrain.new(1, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, 100)

    # dustcolor = ChunkyPNG::Color.rgba(rand(130..170), rand(80..130), rand(50..100), 255)
 #    dust = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, 1)
 #    clay = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, 10)
 #    dirt = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, 25)
  #   soil = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, 50)
  #   earth = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, 100)
  #   mud = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, 200)
  #   loam = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, 500)
   # rock = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 160,  "path", 0, 0)
 
 ####puts x
 ####puts y
   #  caste = rand(0..7)
    # caste = (x*2) % 7
     z = (x*y)

if z < (400*400)
caste = 6
end
if z < (250*250)
        caste = 5
end
if z < (200*200)
        caste = 4
end
    if z < (150*150)
        caste = 3
    end
    if z < (120*120)
        caste = 2
    end
    if z < (101*101)
        caste = 1
    end
    if z < (85*85)
        caste = 0
        end

        if z < (70*70)
            caste = 7
            end
            if z < (15*15)
                caste = 8
                end
    





     case caste
      when 0
          d = Terrain.new(-1, x, y, 1, rand(170..180), rand(110..120), 78,  "path", 0, rand(1..2))
     when 1
         d = Terrain.new(-2, x, y, 1, rand(120..130), rand(80..90), 68,  "path", 0, rand(2..10))
     when 2
         d = Terrain.new(-3, x, y, 1, rand(110..120), rand(70..80), 58,  "path", 0, rand(10..25))
     when 3
         d = Terrain.new(-4, x, y, 1, rand(100..110), rand(60..70), 48,  "path", 0, rand(25..50))
     when 4
         d = Terrain.new(-5, x, y, 1, rand(90..110), rand(50..60), 38,  "path", 0, rand(50..100))
     when 5
         d = Terrain.new(-6, x, y, 1, rand(80..100), rand(40..50), 28,  "path", 0, rand(200..500))
        when 6
            d = Terrain.new(-7, x, y, 1, rand(70..90), rand(30..40), 18,  "path", 0, rand(500..1000))
        when 7
            d = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 100,  "path", 0, -1)
        when 8
            h = rand(3)
                if z < (15*15)
                    h = 2
                   end
                   if z < (10*10)
                        h = 1
                       end
                       if z < (5*5)
                            h = 0
                           end
            case h
            when 0
            d = Terrain.new(-9, x, y, 1, 10, 10, 200,  "path", 3, 5000)

            when 1
            d = Terrain.new(-9, x, y, 1, 30, 30, 210,  "path", 2, 2500)

            when 2
            d = Terrain.new(-9, x, y, 1, 50, 50, 230,  "path", 1, 1000)
            else
                d = Terrain.new(-9, x, y, 1, 35, 35, 200,  "path", 3, -100)
            end
      else 
          d = Terrain.new(-8, x, y, 1, rand(150..170), rand(150..170), 100,  "path", 0, -1)
     end
  ####puts "#{d.r},#{d.g},#{d.b}, #{caste}"
  return d
 end
 

 def fuzzer_x(num, range = $xrange, floor = 0)

    num += rand(-1..1)
    if num < 0
        num = 0
        end
    if num > range
            num = range
    end
    num
 end


 def interact(front, back)
  #  ##puts front.name

    if front.name >= 0 && back.name >= 0
    if front.name < 5  && back.name > 4
        back.energy += front.energy
         if front != nil
        if front.name == 4 && (back.name > 5 && back.name < 99) && (front != nil)
            if rand(100) < back.traits[0] 
            back.growthrate += rand(0..1)
            end
           # back.energy += front.energy
            Plant.all.delete(front)
            front = nil
        end
    end
        Plant.all.delete(front)
        front = nil
    end
   
end
GC.start(full_mark: true, immediate_sweep: true);
 end



 def provide_cloud(x, y, z, season)
    if Weather.all.length < (z) && (season % 2) == 0
    Weather.new(-100, x, y, 1, 255, 255, 255, 50, (rand(5)+3))
    end
 end

 def predation(front, back)
    
    if front.name == back.name
        #puts "#{front.name},    #{back.name}"
    end

    if front.name >= 0 && back.name >= 0
     #   ####puts "fuck"
    if front.name > back.name  && (back.name > 4 && back.name < front.name)
      #  ####puts "#{(back.energy*5)} !!!!!!!"
        front.energy += (back.energy*2)
        Herbivore.all.delete(back)
        back = nil
    end
end
GC.start(full_mark: true, immediate_sweep: true);
 end





 def fuzzer_y(num, range = $yrange, floor = 0)

    num += rand(-1..1)
    if num < 0
        num = 0
        end
    if num > range
            num = range
    end
    num
 end


 def rain(soil, cloud) #changes soil to fit adding water and breaking down waste and the dead
    if soil.name < 0 && soil.name != -100
    evaporation_precipatation = 4
    if (rand 0..3) == 0  && soil.name != -9#makes it rain less continously
    soil.energy += evaporation_precipatation
   cloud.energy -= evaporation_precipatation
    cloud.a -= 1
    cloud.a = [[[[cloud.a, 180].min, 10].max, cloud.energy].min, 1].max
    end
    if soil.energy > 0 && soil.name != -9
        soil.name = -1
        soil.r = rand (170..180)
        soil.g = rand (78..110)
        soil.b = 78
    end

    if soil.energy > 3 && soil.name != -9
        soil.name = -2
        soil.r = rand (120..130)
        soil.g = rand (80..90)
        soil.b = 68
    end

    if soil.energy > 11 && soil.name != -9
        soil.name = -3
        soil.r = rand (110..120)
        soil.g = rand (70..80)
        soil.b = 58
    end

    if soil.energy > 26 && soil.name != -9
        soil.name = -4
        soil.r = rand (100..110)
        soil.g = rand (60..70)
        soil.b = 48
    end

    if soil.energy > 51 && soil.name != -9
        soil.name = -5
        soil.r = rand (90..100)
        soil.g = rand (50..60)
        soil.b = 38
    end

    if soil.energy > 101 && soil.name != -9
        soil.name = -6
        soil.r = rand (80..90)
        soil.g = rand (40..50)
        soil.b = 28
    end

    if soil.energy > 500 && soil.name != -9
        soil.name = -7
        soil.r = rand (70..90)
        soil.g = rand (30..40)
        soil.b = 18
    end

    if soil.energy > 2000 && soil.name != -9
        soil.name = -9
        soil.r = rand(50)
        soil.g = rand(50)
        soil.b = 230
    end
    if soil.energy > 2500 && soil.name != -9
        soil.name = -9
        soil.r = rand(40)
        soil.g = rand(40)
        soil.b = 220
    end
    if soil.energy > 3000 && soil.name != -9
        soil.name = -9
        soil.r = rand(30)
        soil.g = rand(30)
        soil.b = 210
    end

    if soil.name == -9 
        soil.energy -= evaporation_precipatation
        cloud.energy += evaporation_precipatation

        cloud.a += 10
        cloud.a = [[cloud.a, 80].max, 180].min

    end

    if cloud.energy <= 0 && cloud.name == -100
        Weather.all.delete(cloud)
        cloud = nil
        GC.start(full_mark: true, immediate_sweep: true);
    end
end
end
  
 def provideplants(a, b, soil)
     c = rand(a..b)
 

     if soil.name < -4
        case c
        when 0
            d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
           when 1
               d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200)+100), (belllcurve(7)+7))
           when 2
               d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
            when 3
                if rand(64) == 0
                d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800)+250), (belllcurve(15)+15))
                else
                    d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
                   end
        else 
            d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
        end
    elsif soil.name < -2 && soil.name > -5
        case c
        when 0
            d = Plant.new(0, soil.x, soil.y, 1, (rand(50)+20), (rand(104)+150), rand(50), "plant", 0, (belllcurve(100)+10), (belllcurve(5)+3))
           when 1
               d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200)+100), (belllcurve(7)+7))
           when 2
               d = Plant.new(2, soil.x,soil. y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
            when 3 
                if rand(16) == 0
                d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800)+250), (belllcurve(15)+15))
                else
                    d =  Plant.new(1, soil.x, soil.y, 1, (rand(20)+10), (rand(100)+120), rand(20), "plant", 0, (belllcurve(200)+100), (belllcurve(7)+7))
                   end
        else 
            d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
        end
    elsif soil.name > -3
        case c
        when 0
            d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
           when 1
               d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
           when 2
               d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
            when 3
                if rand(8) == 0
             d = Plant.new(4, soil.x, soil.y, 1, 200, 255, rand(50), "plant", 0, (belllcurve(800)+250), (belllcurve(15)+15))
                else
                d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
                end
        else 
            d = Plant.new(2, soil.x, soil.y, 1, rand(10), (rand(50)+100), rand(10), "plant", 0, (belllcurve(500)+200), (belllcurve(10)+10))
        end
       end

 d
 end
  
 def predator_generator(a, b, x, y)
     c = rand(a..b)
 
     case c
     when 0
         d = Predator.new(101, x, y, 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(250)+600), (belllcurve(1)+1), [belllcurve(100), 1, (belllcurve(10)+10)])
        when 1
            d = Predator.new(102, x, y, 1, 255, (rand(20)), rand(10), "pred", 0, (belllcurve(500)+800), (belllcurve(2)+1), [belllcurve(100), 1, (belllcurve(10)+10)])
        when 2
            d = Predator.new(103, x, y, 1, 0, 0, 0, "pred", 0, (belllcurve(1000)+1000), (belllcurve(3)+1), [belllcurve(100), 1, (belllcurve(10)+10)])
     else 
         d = Predator.new(101, x, y, 1, 255, (rand(20)+20), rand(50), "pred", 0, (belllcurve(250)+600), (belllcurve(1)+1), [belllcurve(100), 1, (belllcurve(10)+10)])
     end
 d
 end

 def provideanimals(a, b, x, y)

     c = rand(a..b)
 
     case c
     when 0
        if rand(2) != 0
         d = Herbivore.new(6, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(240)+10), (belllcurve(3)+2), [belllcurve(100), 0, (belllcurve(5)+3)])
        else
            d = Herbivore.new(8, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(900)+10), (belllcurve(1)+1), [belllcurve(100), 0, (belllcurve(7)+6)])
        end
        when 1
            d = Herbivore.new(7, x, y, 1, rand(20), (rand(1)+134), 200, "herbi", 0, (belllcurve(499)+100), (belllcurve(3)+1),  [belllcurve(100), 0, (belllcurve(6)+4)])
        when 2
            d = Herbivore.new(8, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(900)+10), (belllcurve(1)+1),  [belllcurve(100), 0, (belllcurve(7)+6)])
     else 
         d = Herbivore.new(6, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(240)+10), (belllcurve(3)+2),  [belllcurve(100), 0, (belllcurve(5)+3)])
     end
 d
 end
 

 def provide_sea_animals(a, b, x, y)

    c = rand(a..b)

    case c
    when 0
       if rand(2) != 0
        d = Herbivore.new(56, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(3)+2), [belllcurve(100), 1])
       else
           d = Herbivore.new(58, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(800)+10), (belllcurve(1)+1), [belllcurve(100), 1])
       end
       when 1
           d = Herbivore.new(57, x, y, 1, rand(20), (rand(1)+134), 200, "herbi", 0, (belllcurve(400)+100), (belllcurve(3)+1),  [belllcurve(100), 1])
       when 2
           d = Herbivore.new(58, x, y, 1, 150,150, 170, "herbi ", 0, (belllcurve(800)+10), (belllcurve(1)+1),  [belllcurve(100), 1])
    else 
        d = Herbivore.new(56, x, y, 1, 255, (rand(1)+134), rand(255), "herbi", 0, (belllcurve(200)+10), (belllcurve(3)+2),  [belllcurve(100), 1])
    end
d
end

  

z = 0
season = 1
$steps.times do
pngx = ChunkyPNG::Image.new($xrange+1, $yrange+1, ChunkyPNG::Color::BLACK)
if z%100 == 0
    season += 1
end
if z == 0  ##start of the grid
populate
end

paths = Terrain.all.select do |path| path.type = "path" end


        
    clouds  = []
    Weather.all.each do |phenomena|
        if  phenomena.name == -100
            clouds << phenomena
        end
    end

paths.each do |soil|  

if soil.status !=0
        ###puts "#{soil.r},#{soil.g},#{soil.b}"
    pngx[soil.x, soil.y] =  ChunkyPNG::Color.rgba(soil.r, soil.g, soil.b, 255)
    if  (season%2) == 1
     if rand(800000) < soil.energy
        if soil.name != -9
         provideplants(0, 4, soil)
        end
     end
    else 
        if rand(1600000) < soil.energy
            if soil.name != -9
             provideplants(0, 4, soil)
            end
         end
    end
     if soil.name == -9 &&  rand(27000000) < soil.energy
        zrat = z/season
        provide_cloud(soil.x, soil.y, zrat, season)
    end
rainingzone = clouds.select do |raincloud| raincloud.x == soil.x && raincloud.y == soil.y end

    if rainingzone.length > 0
        rainingzone.each do |rainingzones|  rain(soil, rainingzones) end
    end


end
end



#    plants = Plant.all.select do |plant| plant.type == "plant" && plant.status != 0  && (plant.name > -1 && plant.name < 5) end


 # plants.each do |plant|  
#    end

  #  herbivores = Herbivore.all.select do |animal| animal.name > 5  && animal.name < 99 end






            #herbivores.each do |animal|  
    #        herbivores.each do |animal|
     #   end





        plantoids = []
        animals = []
        predators = []
        water = []

        Fighter.all.each do |object| 

        if object != nil
            if object.name == -9
                water << object
            end
        end
        if object != nil
            if (object.name == 0 || object.name == 1 ||   object.name == 2 || object.name == 4) && object.name > -1  && object.name < 5
                plantoids << object
                if object.status != 0
                pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                        if object.name < 5 && object.name > -1
    
                    toilet = paths.find do |defecationzone| defecationzone.x == object.x &&  defecationzone.y == object.y end
                        if toilet.energy > object.growthrate && object.type != "path"
                        toilet.energy -= object.growthrate
                        object.energy += object.growthrate
                        end
                        end
                end
            end
        end
        if object != nil
            if object.name > 5 && object.name < 99
                animals << object
## beign


leftright = []
updown = []
leftright = (Fighter.all.select do |prey|  (prey.x  == object.x) && (prey.y <= (object.y+object.traits[2])) &&  (prey.y >= (object.y-object.traits[2])) && (prey.name < 5 && prey.name > -1) end)
updown = (Fighter.all.select do |prey|   (prey.y  == object.y)  && (prey.x <= (object.x+object.traits[2])) &&  (prey.x >= (object.x-object.traits[2])) && (prey.name < 5 && prey.name > -1) end)
    if rand(0..1) == 0
    if leftright.length != 0 && updown.length == 0
        #check
       quarry =  leftright.select do |prey| prey.name < 5 &&  prey.name > -1 end
        quarry = quarry.max_by do |prey| prey.energy end
        if quarry != nil
        if quarry.y > object.y && (quarry.x == object.x)
            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
            object.y += 1
            
            ##puts "down #{quarry.name}"
        elsif quarry.y < object.y && (quarry.x == object.x)
             pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
            object.y -=1
            
           ##puts "up #{quarry.name}"
        end
    end
    end
    if updown.length != 0
    #check
        quarry =  updown.select do |prey| prey.name < 5 &&  prey.name > -1 end
            quarry = quarry.max_by do |prey| prey.energy end
            if quarry != nil
            if quarry.x > object.x && (quarry.y == object.y)
                 pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                object.x += 1
                
              ##puts "right #{quarry.name}" 
            elsif quarry.x < object.x && (quarry.x == object.x)
               pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                object.x -=1
                
               ##puts "left #{quarry.name}"
            end
        end
    end
else
    if updown.length != 0 && leftright.length == 0
     #check
        quarry =  updown.select do |prey| prey.name < 5 &&  prey.name > -1 end
            quarry = quarry.max_by do |prey| prey.energy end
            if quarry != nil
            if quarry.x > object.x && (quarry.y == object.y)
                 pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                object.x += 1
                
          ##puts "left #{quarry.name}" 
            elsif quarry.x < object.x && (quarry.y == object.y)
               pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                object.x -=1
                
           ##puts "right #{quarry.name}"
            end
        end
    end
    if leftright.length != 0
        #check
        quarry =  leftright.select do |prey| prey.name < 5 &&  prey.name > -1 end
            quarry = quarry.max_by do |prey| prey.energy end
         if quarry != nil
         if quarry.y > object.y && (quarry.x == object.x)
             pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
             object.y += 1
             
            ##puts "down#{quarry.name}"
         elsif quarry.y < object.y && (quarry.x == object.x)
              pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
             object.y -=1
             
            ##puts "up #{quarry.name}"
         end
     end
     end
    
end
    if updown.length == 0 && leftright.length == 0
        object.x = fuzzer_x(object.x)
        object.y = fuzzer_y(object.y)
        pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
    end

##edn
          #  pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
         #   object.x = fuzzer_x(object.x)
        #    object.y = fuzzer_y(object.y)
            if object.name > 5 && object.name < 99
                #put somthing that gives energy to the soil(done V )
                toilet = paths.find do |defecationzone| defecationzone.x == object.x &&  defecationzone.y == object.y end
                toilet.energy += object.growthrate
                object.energy -= object.growthrate
            end
            if (object.energy > 2000 && object.name == 8) ||  (object.energy > 1000 && object.name == 7) ||  (object.energy > 500 && object.name == 6)
                if object.name == 8
                        object.energy -= 1000    
                       d = Herbivore.new(object.name, object.x, object.y, object.status, [object.r+rand(-10..10), 255].min, [object.g+rand(-10..10), 150].min, [object.b+rand(-10..10), 255].min, object.type, object.depth, 750, object.growthrate, object.traits)
                                               d.traits[0] += rand(-1..1)
                        d.traits[1] += rand(-1..1)
                        d.traits[1] = [d.traits[1], 0].max
                         d.traits[2] += rand(-1..1)
                        d.traits[2] = [d.traits[2], 1].max
                    elsif object.name ==7
                    object.energy -= 500
                    2.times do
                     d =Herbivore.new(object.name, object.x, object.y, object.status, [object.r+rand(-10..10), 255].min, [object.g+rand(-10..10), 150].min, [object.b+rand(-10..10), 255].min, object.type, object.depth, 160, object.growthrate, object.traits)
                                             d.traits[0] += rand(-1..1)
                        d.traits[1] += rand(-1..1)
                        d.traits[1] = [d.traits[1], 0].max
                     d.traits[2] += rand(-1..1)
                     d.traits[2] = [d.traits[2], 1].max
                    end
                elsif object.name == 6
                    object.energy -= 250
                    3.times do 
                     d = Herbivore.new(object.name, object.x, object.y, object.status, [object.r+rand(-10..10), 255].min, [object.g+rand(-10..10), 150].min, [object.b+rand(-10..10), 255].min, object.type, object.depth, 50, object.growthrate, object.traits)
                                            d.traits[0] += rand(-1..1)
                        d.traits[1] += rand(-1..1)
                        d.traits[1] = [d.traits[1], 0].max
                    d.traits[2] += rand(-1..1)
                    d.traits[2] = [d.traits[2], 1].max
                    end
                end
            end
            if object.energy <= 0
                Herbivore.all.delete(object)
                object = nil
        GC.start(full_mark: true, immediate_sweep: true);
            end
            end
        end
            if object != nil
            if object.name > 99 
                predators << object

                if false
                   
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                   object.x = fuzzer_x(object.x)
                    object.y = fuzzer_y(object.y)
                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    object.x = fuzzer_x(object.x)
                    object.y = fuzzer_y(object.y)
                    else
                        leftright = []
                        updown = []
                        leftright = (Herbivore.all.select do |prey|   (prey.x  == object.x) && (prey.y <= (object.y+object.traits[2])) &&  (prey.y >= (object.y-object.traits[2]))   &&  (prey.name < 99 && prey.name > 5) end)
                        updown = (Herbivore.all.select do |prey|    (prey.y  == object.y)  && (prey.x <= (object.x+object.traits[2])) &&  (prey.x >= (object.x-object.traits[2]))  && (prey.name < 99 && prey.name > 5) end)
                            if rand(0..1) == 0
                            if leftright.length != 0
                               quarry =  leftright.select do |prey| prey.name < 99  &&  prey.name > 4 end
                                quarry = quarry.max_by do |prey| prey.energy end
                                if quarry != nil
                                if quarry.y > object.y && (quarry.x == object.x)
                                    pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                    object.y += 1
                                elsif quarry.y < object.y && (quarry.x == object.x)
                                     pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                    object.y -=1
                                end
                            end
                            end
                            if updown.length != 0
                                quarry =  updown.select do |prey| prey.name < 99  &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                    if quarry != nil
                                    if quarry.x > object.x && (quarry.y == object.y)
                                         pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                        object.x += 1
                                    elsif quarry.x < object.x && (quarry.x == object.x)
                                       pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                        object.x -=1
                                    end
                                end
                            end
                        else
                            if updown.length != 0
                                quarry =  updown.select do |prey| prey.name < 99  &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                    if quarry != nil
                                    if quarry.x > object.x && (quarry.y == object.y)
                                         pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                        object.x += 1
                                    elsif quarry.x < object.x && (quarry.y == object.y)
                                       pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                        object.x -=1           
                                    end
                                end
                            end
                            if leftright.length != 0
                                #check
                                quarry =  leftright.select do |prey| prey.name < 99  &&  prey.name > 4 end
                                    quarry = quarry.max_by do |prey| prey.energy end
                                 if quarry != nil
                                 if quarry.y > object.y && (quarry.x == object.x)
                                     pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                     object.y += 1
                                     
                                     ####puts "Let there be light! #{quarry.name}"
                                 elsif quarry.y < object.y && (quarry.x == object.x)
                                      pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                     object.y -=1
                                     
                                    # ####puts "Let there be light! #{quarry.name}"
                                 end
                             end
                             end
                            
                        end
                            if updown.length == 0 && leftright.length == 0
                                object.x = fuzzer_x(object.x)
                                object.y = fuzzer_y(object.y)
                                pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                                object.x = fuzzer_x(object.x)
                                 object.y = fuzzer_y(object.y)
                                
                            end
                            pngx[object.x, object.y] = ChunkyPNG::Color.rgba(object.r, object.g, object.b, 255)
                    end

                    if object != nil
                if object.name > 99 
                    toilet = paths.find do |defecationzone| defecationzone.x == object.x &&  defecationzone.y == object.y && defecationzone.name < 0 end
                        toilet.energy += object.growthrate
                    object.energy -= object.growthrate
                 #   ####puts "#{object.energy},  #{object.growthrate}" 
                    end
                    if (object.energy > 55000 && object.name == 103) ||  (object.energy > 35000 && object.name == 102) ||  (object.energy > 25000 && object.name == 101)
                        if object.name == 103
                        object.energy -= 35000
                        ####puts "New Tiger!"
                        d = Predator.new(object.name, object.x, object.y, object.status, [object.r+rand(-10..10), 255].min, [object.g+rand(-10..10), 150].min, [object.b+rand(-10..10), 255].min, object.type, object.depth, 5000, object.growthrate, object.traits)
                                                d.traits[0] += rand(-1..1)
                        d.traits[1] += rand(-1..1)
                        d.traits[1] = [d.traits[1], 0].max
                        d.traits[2] += rand(-1..1)
                        d.traits[2] = [d.traits[2], 1].max
                        
                    elsif object.name ==102
                            object.energy -= 20000
                            ####puts "New Pythons!"
                            2.times do
                                if rand(0..1) == 0
                            d =Predator.new(object.name, object.x, object.y, object.status, [object.r+rand(-10..10), 255].min, [object.g+rand(-10..10), 150].min, [object.b+rand(-10..10), 255].min, object.type, object.depth, 1000, object.growthrate, object.traits)
                                d.traits[0] += rand(-1..1)
                                 d.traits[1] += rand(-1..1)
                                d.traits[1] = [d.traits[1], 0].max
                                d.traits[2] += rand(-1..1)
                                d.traits[2] = [d.traits[2], 1].max
                            
                        end
                            end
                           elsif object.name == 101
                            object.energy -= 10000
    
                        ####puts "New Mongooses!"
                        3.times do
                            if rand(0..4) == 0
                        d = Predator.new(object.name, object.x, object.y, object.status, [object.r+rand(-10..10), 255].min, [object.g+rand(-10..10), 150].min, [object.b+rand(-10..10), 255].min, object.type, object.depth, 500, object.growthrate, object.traits)
                                                d.traits[0] += rand(-1..1)
                        d.traits[1] += rand(-1..1)
                        d.traits[1] = [d.traits[1], 0].max
                        d.traits[2] += rand(-1..1)
                        d.traits[2] = [d.traits[2], 1].max
                        
                    end
                        end
                     end
                    end
                    if object.energy <= 0
                        ####puts "Predator Death!"
                        Predator.all.delete(object)
                        object = nil
                GC.start(full_mark: true, immediate_sweep: true);
                    end
                end
            end
        end
    end
        matches = []
            matches = animals + plantoids + predators + water + clouds

    z +=1
    y = 0
    x = 0
    ($yrange+1).times do #plus 1 to fix edge glitch
        ($xrange+1).times do
        gather = matches.select do |part| part.x == x && part.y == y end
               
            ace = gather.find do |obj| obj.name > 5  && obj.name < 99 end
            bace  = gather.find do |obj| obj.name >= 0  && obj.name < 6 end
            cace = (gather.select do |obj| obj.name >= 100 end).uniq
            dace = gather.find do |obj| obj.name == -9 end
            





                        
                        if bace != nil && ace != nil
                            if bace.name != -100 && ace.name != -100 && (bace.name > -1 && ace.name > -1)
                            interact(bace, ace)
                            end
                        end    
                        if cace[0] != nil && ace != nil

                           if cace[0].name != -100 && ace.name != -100  && (cace[0].name > -1 && ace.name > -1)
                           predation(cace[0], ace)
                           #$eaten+=1
                           end
                        end
=begin
                        if cace[0] != nil && cace[1] != nil
                #           if cace[0].name != -100 && cace[1].name != -100  && (cace[0].name > -1 && cace[1].name > -1
                            if cace[0].name > cace[1].name
                            predation(cace[1], cace[0])

                       #\\     #puts "here"

                            else
                            predation(cace[0], cace[1])
                            #puts cace[0]
                            #puts cace[1]
                           # #puts "here"

                   #         end
                           #$eaten+=1
                           end
                        end
=end



                        if dace != nil
                                if bace != nil 
                                    if dace.name != -100 && bace.name != -100 
                                    swim(dace, bace)
                                    end
                                end    
                                if ace != nil

                            if dace.name != -100 && ace.name != -100
                                    swim(dace, ace)
                            end
                                end    
                                if cace[0] != nil && ace != nil

                            if dace.name != -100 && cace[0].name != -100
                                    swim(dace, cace[0])
                            end
                                end
                          end


                        
            x+=1
        end
        x  = 0
        y+=1
    end


   dead = Plant.all.select do |every|  every == nil end

   # ####puts dead.length
Plant.all.delete_if do |obj| dead.include?(obj) end



    #if z == 5
     #   dogs.clear
     #   end
            clouds.each do |cloud|
                if rand(0..3) != 0
                if cloud.x > cloud.y && rand(0..1) == 0 && rand(0..1) == 0 && rand(0..1) == 0 && rand(0..1) == 0
                    cloud.y +=1
                    cloud.y = [$yrange, cloud.y].min
                end
                if cloud.y > cloud.x  && rand(0..1) == 0 && rand(0..1) == 0 && rand(0..1) == 0 && rand(0..1) == 0
                    cloud.x +=1
                    cloud.x = [$xrange, cloud.x].min
                end
                if ((cloud.x-15)..(cloud.x+15)) == ((cloud.y-15)..(cloud.y+15))
                    if rand(0..1) == 0
                        cloud.x +=1
                        cloud.x = [$xrange, cloud.x].min
                    end
                    if rand(0..1) == 0
                        cloud.y+=1
                        cloud.y = [$yrange, cloud.y].min
                    end
                end
                if rand(0..1) == 0
                    cloud.x +=1
                    cloud.x = [$xrange, cloud.x].min
                end
                if rand(0..1) == 0
                    cloud.y+=1
                    cloud.y = [$yrange, cloud.y].min
                end

                if cloud.x > cloud.y && rand(0..1) == 0 && rand(0..3) == 0 
                    cloud.y +=1
                    cloud.y = [$yrange, cloud.y].min
                end
                if cloud.y > cloud.x  && rand(0..1) == 0 && rand(0..3) == 0 
                    cloud.x +=1
                    cloud.x = [$xrange, cloud.x].min
                end
            end
                distx = $xrange - cloud.x
                disty = $xrange - cloud.y

                if (cloud.x > 6 && cloud.y > 6) && (cloud.x < ($xrange -6) && cloud.y < ($yrange-6))
                54.times do
                    fuzzx = rand(-6..6)
                    fuzzy = rand(-6..6)
                red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                cloudred =  cloud.r * (cloud.a/6)
                cloudgreen =  cloud.g * (cloud.a/6)
                cloudblue = cloud.b * (cloud.a/6)
                red = [((cloudred+red)/255).to_i, 255].min
                green = [((cloudgreen+green)/255).to_i, 255].min
                blue = [((cloudblue+blue)/255).to_i, 255].min
                pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                end
            end



            if (cloud.x > 5 && cloud.y > 5) && (cloud.x < ($xrange -5) && cloud.y < ($yrange-5))


                45.times do
                    fuzzx = rand(-5..5)
                    fuzzy = rand(-5..5)
                red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                cloudred =  cloud.r * (cloud.a/5)
                cloudgreen =  cloud.g * (cloud.a/5)
                cloudblue = cloud.b * (cloud.a/5)
                red = [((cloudred+red)/255).to_i, 255].min
                green = [((cloudgreen+green)/255).to_i, 255].min
                blue = [((cloudblue+blue)/255).to_i, 255].min
                pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                end
            end   
            


                if (cloud.x > 4 && cloud.y > 4) && (cloud.x < ($xrange -4) && cloud.y < ($yrange-4))


                    36.times do
                        fuzzx = rand(-4..4)
                        fuzzy = rand(-4..4)
                    red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    cloudred =  cloud.r * (cloud.a/4)
                    cloudgreen =  cloud.g * (cloud.a/4)
                    cloudblue = cloud.b * (cloud.a/4)
                    red = [((cloudred+red)/255).to_i, 255].min
                    green = [((cloudgreen+green)/255).to_i, 255].min
                    blue = [((cloudblue+blue)/255).to_i, 255].min
                    pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                    end
                end

                if (cloud.x > 3 && cloud.y > 3) && (cloud.x < ($xrange -3) && cloud.y < ($yrange-3))


                    27.times do
                        fuzzx = rand(-3..3)
                        fuzzy = rand(-3..3)
                    red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    cloudred =  cloud.r * (cloud.a/4)
                    cloudgreen =  cloud.g * (cloud.a/4)
                    cloudblue = cloud.b * (cloud.a/4)
                    red = [((cloudred+red)/255).to_i, 255].min
                    green = [((cloudgreen+green)/255).to_i, 255].min
                    blue = [((cloudblue+blue)/255).to_i, 255].min
                    pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                    end
                end

                if (cloud.x > 2 && cloud.y > 2) && (cloud.x < ($xrange -2) && cloud.y < ($yrange-2))
                    18.times do
                        fuzzx = rand(-2..2)
                        fuzzy = rand(-2..2)
                    red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    cloudred =  cloud.r * (cloud.a/4)
                    cloudgreen =  cloud.g * (cloud.a/4)
                    cloudblue = cloud.b * (cloud.a/4)
                    red = [((cloudred+red)/255).to_i, 255].min
                    green = [((cloudgreen+green)/255).to_i, 255].min
                    blue = [((cloudblue+blue)/255).to_i, 255].min
                    pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                    end
                end




                if (cloud.x > 1 && cloud.y > 1) && (cloud.x < ($xrange -1) && cloud.y < ($yrange-1))


                    9.times do
                        fuzzx = rand(-1..1)
                        fuzzy = rand(-1..1)
                    red = ChunkyPNG::Color.r(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    green = ChunkyPNG::Color.g(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    blue =  ChunkyPNG::Color.b(pngx[cloud.x+fuzzx, cloud.y+fuzzy]) *255
                    cloudred =  cloud.r * (cloud.a/4)
                    cloudgreen =  cloud.g * (cloud.a/4)
                    cloudblue = cloud.b * (cloud.a/4)
                    red = [((cloudred+red)/255).to_i, 255].min
                    green = [((cloudgreen+green)/255).to_i, 255].min
                    blue = [((cloudblue+blue)/255).to_i, 255].min
                    pngx[cloud.x+fuzzx, cloud.y+fuzzy] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                    end
                end


                
                red = ChunkyPNG::Color.r(pngx[cloud.x, cloud.y]) *255
                green = ChunkyPNG::Color.g(pngx[cloud.x, cloud.y]) *255
                blue =  ChunkyPNG::Color.b(pngx[cloud.x, cloud.y]) *255
                cloudred =  cloud.r * cloud.a
                cloudgreen =  cloud.g * cloud.a
                cloudblue = cloud.b * cloud.a
                red = [((cloudred+red)/255).to_i, 255].min
                green = [((cloudgreen+green)/255).to_i, 255].min
                blue = [((cloudblue+blue)/255).to_i, 255].min
                pngx[cloud.x, cloud.y] = ChunkyPNG::Color.rgba(red, green, blue, 255)
                
                    if cloud.x == $xrange && cloud.y == $yrange
                        Weather.all.delete(cloud)
                        cloud = nil
                        GC.start(full_mark: true, immediate_sweep: true);
                    end
            end

            cloudnum = clouds.length
        endnumclouds = (clouds.select do |cloud| cloud.x == $xrange && cloud.y == $yrange && cloud.energy <= 0  end)
        endnumclouds.each do |cloud| 
            Weather.all.delete(cloud) 
            cloud = nil
            GC.start(full_mark: true, immediate_sweep: true);
        end




pngx.save("gifmake28/life/#{z}.png")
puts "#{plantoids.length/2} plants!"
puts "#{animals.length/2} herbivores!"
puts "#{predators.length/2} predators!"
puts "#{clouds.length} clouds!"
puts z
####puts $eaten
end








