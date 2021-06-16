
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

//Para probar metodos AgentService
/*
var agente01 = agents[0]
//agente01.checkRegisters(arrayMeter:meters)
//agente01.checkMeters(arrayMeter:meters)
var a = Appeal(idAppeal:1, situation:"Muy caro", attended:false, register:registers[0])
appeals.append(a)
var a2 = Appeal(idAppeal:2, situation:"Muy caro pa", attended:false, register:registers[1])
appeals.append(a2)
agente01.checkAppels(arrayAppeals:appeals)
*/