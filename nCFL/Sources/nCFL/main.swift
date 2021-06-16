
import Foundation

let control = Control()

var clientsJSON:[[String:Any]] = control.getDataJson(value:"Clients")
var agentsJSON:[[String:Any]] = control.getDataJson(value:"Agents")
var registersJSON:[[String:Any]] = control.getDataJson(value:"Registers")
var metersJSON:[[String:Any]] = control.getDataJson(value:"Meters")


var registers:[Register] = control.getRegisters(value:registersJSON)
var meters:[ElectricMeter] = control.getMeters(value:metersJSON, value2:registers)
var agents:[AgentService] = control.getAgents(value:agentsJSON)
var appeals:[Appeal] = []
var clients:[Client] = control.getClients(value:clientsJSON, value2:meters)



