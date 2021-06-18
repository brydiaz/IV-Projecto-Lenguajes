
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

/*
var agente01 = agents[0]
agente01.checkRegisters(arrayMeter:meters)
agente01.checkMeters(arrayMeter:meters)
var a = Appeal(idAppeal:1, situation:"Muy caro", attended:false, register:registers[0], idClient:1, clientName:"Bryan")
appeals.append(a)
var a2 = Appeal(idAppeal:2, situation:"Muy caro pa", attended:false, register:registers[0], idClient:2, clientName:"Josue")
appeals.append(a2)
agente01.checkAppels(arrayAppeals:appeals)
agente01.fixAppeal(appeal:appeals[1])
agente01.checkAppels(arrayAppeals:appeals)
print(meters[0].getConsumption())
print(meters[0].getRate())
agente01.fixMeterCons(meter:meters[0],value:600.00)
print(meters[0].getConsumption())
print(meters[0].getRate())
*/




//Esto es para probar como funciona lo de pagar
/*
let c:Client = clients[0]
print(c.checkOwnRegisters())
c.payPending(meter:c.getMeters()[0], registerID:1)
print(c.checkOwnRegisters())
*/

//INICIO DEL PROGRAMA

var mainClientUser:Client?
var mainAgentUser:AgentService?

let (idUser, type):(Int, Int) = control.logIn(clients:clients, agents:agents) // SE VERIFICA EL LOGIN

if type == 1{
    for c in clients{
        if c.getId() == idUser{
            mainClientUser = c
        }
    }
    control.mainClient(client:mainClientUser!, appeals:appeals)
}else if type == 2{
    for a in agents{
        if a.getId() == idUser{
            mainAgentUser = a
        }
    }
    control.mainAgent(agent:mainAgentUser!, clients:clients, meters:meters,registers:registers, appeals:appeals)
}else{
    print("Inicio Erroneo")
}
