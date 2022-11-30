width = 800
height = 800

angle = 0.0
pause = false
scale = 20


function CreateTerrain()
	local vertices = {}
    
	for y=0, height-1 do
        for x=0, width-1 do
            xCoord, yCoord = love.graphics.inverseTransformPoint( x, y )
            xCoord1, yCoord1 = love.graphics.inverseTransformPoint( x, y + 1)

            table.insert(vertices, {xCoord, yCoord} )
            table.insert(vertices, {xCoord, yCoord1} )
        end
	end
	
	return love.graphics.newMesh(vertices, "strip")
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        pause = not pause
    end

    if key == "escape" then
        love.event.quit()
    end

    if key == "n" then
        scale = scale - 10
        print(scale)
    end

    if key == "m" then
        scale = scale + 10
        print(scale)

    end

end

function love.update(dt)
    if not pause then
        angle = angle + .5 * math.pi * dt
    end
end


function love.load()
	mesh = CreateTerrain()
end

function love.draw(dt)
	local centerX = width/2
	local centerY = height/2

    love.graphics.push() 
    love.graphics.translate(centerX, centerY)
	love.graphics.rotate(angle)
	love.graphics.translate(-centerX, -centerY)

    love.graphics.setWireframe( true )
    love.graphics.draw(mesh, 0, 0, 0, scale,  scale, 0,0)
    love.graphics.pop() 
end