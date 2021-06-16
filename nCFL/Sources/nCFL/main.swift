
import Foundation
//import SwiftyJSON

var u = User(id:1, name:"Bryan", password:"Hola Mundo")
var m = ElectricMeter(idMeter:1, type:"last", consumption:212.1)
var r = Register(idRegister:1, idMeter:1, pending:true, paidAmount:0.0,pendingAmout:1230.21)
var a = Appeal(idAppeal:1, situation:"Muy caro", attended:false, register:r)
var c = Client(id:2, name:"C1", password:"p1")
var aS = AgentService(id:1, name:"AS1", password:"p2")
print("USUARIO:",u.description)
m.addRegister(value:r)
print("MEDIDOR: ",m.description)
print("REGISTRO: ",r.description)
print("APELACION: ", a.description)
c.addMeter(meter:m)
print("CLIENTE: ",c.description)
print("AGENTE: ",aS.description)
aS.checkMeters()


//-----------------------------------------------------------------------------------------------
/*Hice un archivo json, lo cargo en Package.swift, intente con SwiftyJson que es
  una biblioteca para facilitar la carga pero da error en el build
  Realice la funcion readLocalJson para leer el archivo json y retorna los datos
  La funcion parse usa decoder para pasar los datos al struct
  El struct es de prueba, deberia ser a la clase
  El codigo no genera errores, pero no se cargan los datos, es nil
*/

struct client: Codable {

    let id: Int
    let name: String
    let password: String
}

struct clientSample: Codable {
    let clients: [client]
}

//Funcion para leer el archivo json
func readLocalJson(forName name: String) -> Data? {
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            return data
        }
    } catch {
        print("error: \(error)")
    }
    return nil
}

//Recibe los datos en json y los transforma en struct
func parse(jsonData: Data) -> clientSample? {
    do {
        let decodedData = try JSONDecoder().decode(clientSample.self, from: jsonData)
        //print(decodedData.clients)
        return decodedData
    } catch {
        print("error: \(error)")
    }
    return nil
}

//Ejemplo de uso
let clientList: clientSample?
let jsonData = readLocalJson(forName: "data")
if let data = jsonData {
    if let clientObject = parse(jsonData: data) {
        clientList = clientObject
        //print("client list: \(clientList.clients)")
        //print("name:\(clientList.clients.first?.name ?? "")")

    }
}

//-------------------------------------------------------------------------------------------------


