
import Foundation

let control = Control()

var clientsJSON:[[String:Any]] = control.getDataJson(value:"Clients")
var agentsJSON:[[String:Any]] = control.getDataJson(value:"Agents")
var registersJSON:[[String:Any]] = control.getDataJson(value:"Registers")
var metersJSON:[[String:Any]] = control.getDataJson(value:"Meters")




print(clientsJSON)
print("\n")
print(agentsJSON)
print("\n")
print(registersJSON)
print("\n")
print(metersJSON)

 


