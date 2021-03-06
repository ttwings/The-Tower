--[[

an actor is a interactive gameobject object (player, npc, enemy)

]]
require("..engine.lclass")

require("..engine.navigation.navagent")
require("..engine.collision.boxcollider")
require("..engine.collision.circlecollider")
require("..engine.render.boundingbox")
require("..engine.navigation.navbox")

local Vec = require("..engine.math.vector")

class "Actor" ("GameObject")

function Actor:Actor( actorName, instName, positionX, positionY )
  self.instancename = instName

  self.name      = actorName
  self.position  = Vec( positionX, positionY )

  self.map   = nil
  self.area  = nil

  self.boundingbox = nil

  self.navagent = nil
  self.navmap   = nil
end

function Actor:getKind()
  return "Actor"
end

function Actor:setMap( mapToSet, areaToSet, spawnPointToSet )
  self.map   = mapToSet
  self.area  = areaToSet

  if ( self.navagent ) then
    self.navagent:setMap( mapToSet )
    self.navagent:setNavMesh( self.area:getNavMesh() )
  end

  if ( spawnPointToSet ) then
    local pos = spawnPointToSet:getPosition()

    self:setLayer( spawnPointToSet:getLayer() )

    self:setPosition( pos.x, pos.y )
  end

end

function Actor:getMap()
  return self.map
end

function Actor:getArea()
  return self.area
end

function Actor:setArea( areaToSet )
  self.area = areaToSet
end

function Actor:getNavAgent()
  return self.navagent
end

function Actor:setNavAgent( agentToSet, agentSpeed )
  self.navagent = agentToSet
  self.navagent:setSpeed( agentSpeed )
end

function Actor:getBoundingBox()
  return self.boundingbox
end

function Actor:setBoundingBox( boundingBoxToSet )
  self.boundingbox = boundingBoxToSet
end

function Actor:setNavMap( navmapToSet )
  self.navmap = navmapToSet
end
