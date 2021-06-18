
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

//INICIO DEL PROGRAMA


var clientTemp:Client?
var agentTemp:AgentService?
var client:Client?
var agent:AgentService?

public func logIn()->(Int, Int){

        print("\nBienvenido al Sistema.\nIdentificate!\n")
        print("ID: ",terminator:"")
        let id = Int(readLine()!)
        print("PASSWORD: ",terminator:"")
        let password = String(readLine()!)
        

        for c in clients{
            if id == c.getId(){
                clientTemp = c
            }
        }
        for a in agents{
            if id == a.getId(){
                agentTemp = a
            }
        }
    
        if clientTemp != nil && agentTemp != nil{
            print("EXISTE UN AGENTE Y UN USUARIO CON EL ID PREVISTO")
            print("1. LOGIN COMO USUARIO 2. LOGIN COMO AGENTE")
            print("ELECCIÓN: ",terminator:"")
            print("\n")
            let op = Int(readLine()!)
            if op == 1{
                print("LOGIN COMO USUARIO")
                if clientTemp!.getPassword() == password{
                    print("Bienvenido ",clientTemp!.getName())
                    return (clientTemp!.getId(), 1)
                }else{
                    print("ERROR EN EL PASSWORD, VUELVE A TRATAR")
                    logIn()
                }
            }else if op == 2{
                print("LOGIN COMO AGENTE")
                if agentTemp!.getPassword() == password{
                    print("Bienvenido ",agentTemp!.getName())
                    return (agentTemp!.getId(), 2)
                }else{
                    print("ERROR EN EL PASSWORD, VUELVE A TRATAR")
                    logIn()
                }
                
            }else{
                print("OPCION INVALIDA, VUELVE A TRATAR")
                logIn()
            }
        }else if clientTemp != nil && agentTemp == nil{
            print("LOGIN COMO USUARIO")
            if clientTemp!.getPassword() == password{
                    print("Bienvenido ",clientTemp!.getName())
                    return (clientTemp!.getId(), 1)
            }else{
                print("ERROR EN EL PASSWORD, VUELVE A TRATAR")
                logIn()
            }

        }else if clientTemp == nil && agentTemp != nil{
            print("LOGIN COMO AGENTE")
            if agentTemp!.getPassword() == password{
                    print("Bienvenido ",agentTemp!.getName())
                    return (agentTemp!.getId(), 2)
            }else{
                print("ERROR EN EL PASSWORD, VUELVE A TRATAR")
                logIn()
            }
        }else{
            print("NO CORRESPONDEN SUS DATOS A NADIE")
            print("1. SALIR 2. REINTENTAR")
            let op = Int(readLine()!)
            if op == 1{
                //Aca salimos
            }else if op == 2{
                logIn()
            }else{
                print("OPCION INVALIDA, CIERRE DE PROGRAMA")
            }

           
        }

        return (0, -1)


    }


public func mainClient(){

        print("\nMenú Cliente\n")
        print("1. Ver registros de los medidores asociados")
        print("2. Pagar algún registro pendiende por ID")
        print("3. Apelar algún registro por ID")
        print("4. Salir")

        let op = String(readLine()!)

        // Mostrar los medidores asociados y sus registros
        if op == "1"{
            print(client!.showAllRegisters(arrayMeter:client!.getMeters()))
            mainClient()

        // Pagar la factura de un medidor
        }else if op == "2"{
            Glibc.system("clear")
            print("\nIngrese el ID del medidor a pagar: ",terminator:"")
            let idMeter = Int(readLine()!)

            print("\nIngrese el ID del registro perteneciente a ese medidor: ",terminator:"")
            let idRegisterMeter1 = Int(readLine()!)!
            

            var meterFound = false
            for i in client!.getMeters(){
                if i.getId() == idMeter{
                    meterFound = true
                    client!.payPending(meter: i, registerID: idRegisterMeter1)
                    break
                }  
            }
            print("\n")
            mainClient()



        // Apelaciones
        }else if op == "3"{
            Glibc.system("clear")
            print("\nIngrese el ID del medidor a apelar: ",terminator:"")
            let idMeter = Int(readLine()!)!

            print("Ingrese el ID del registro a apelar perteneciente a ese medidor: ",terminator:"")
            let idRegisterMeter1 = Int(readLine()!)!


            // Este objeto retorna una apelación
            var clientAppeal = client!.appeal(meterId: idMeter, registerId: idRegisterMeter1)

            appeals.append(clientAppeal)
            

            print("\n")
            mainClient()


        }else if op == "4"{
            print("\nGRACIAS POR USAR")
            print(appeals)
        }else{
            print("\nOPCION INVALIDA")
            mainClient()
        }
        
    }

public func mainAgent(){

        print("\n**Menú agente**\n")
        print("1. Ver medidores")
        print("2. Ver registros")
        print("3. Ver apelaciones")
        print("4. Resolver apelacion por ID")
        print("5. Arreglar medidor por ID")
        print("6. Salir\n")
        print("Ingrese una opcion: ")

        let op = String(readLine()!)
        if op == "1"{
            Glibc.system("clear")
            //print("\nACA MOSTRARIA LOS MEDIDORES")
            agent!.checkMeters(arrayMeter:meters)
            print("\n")
            mainAgent()
            
        }else if op == "2"{
            Glibc.system("clear")
            //print("\nACÁ MOSTRARIA LOS REGISTROS")
            agent!.checkRegisters(arrayMeter:meters)
            print("\n")
            mainAgent()
        }else if op == "3"{
            Glibc.system("clear")
            //print("\ACA MOSTRARIA LAS APELACIONES")
            agent!.checkAppels(arrayAppeals:appeals)
            print("\n")
            mainAgent()
        }else if op == "4"{
            Glibc.system("clear")
            //print("\nACA SE TRABAJA APELACION POR ID")
            let lenAppeals = appeals.count
            if  lenAppeals == 0 {
                print("\nNO EXISTEN APELACIONES EN EL SISTEMA")
                print("\n")
            }else{
                print("Ingrese el id de la apelacion:")
                if let appealId = Int(readLine()!){
                    for a in appeals{
                        if a.getId() == appealId{
                            if a.getAttended() == false{
                                agent!.fixAppeal(appeal:a)
                            }else{
                                print("\nESTA APELACION YA FUE ATENDIDA")
                            }
                        }
                    }
                
                }else{
                    print("\nINGRESE UN ID")
                }
                   
            }
            print("\n")
            mainAgent()
        
        }else if op == "5"{
            Glibc.system("clear")
            //print("\nACA SE CAMBIA CONSUMO DE MEDIDOR POR ID")
            print("Ingrese el id del medidor:")
            if let meterId = Int(readLine()!){
                for m in meters{
                    if m.getId() == meterId{
                        print("\nIngrese el nuevo consumo:")
                        if let newConsumption = Double(readLine()!){
                            agent!.fixMeterCons(meter:m,value:newConsumption)

                        }else{
                            print("INGRESE UN NUEVO CONSUMO")
                        }
                    }
                }
            
            }else{
                print("\nINGRESE UN ID")
            }
            
            print("\n")
            mainAgent()
        }else if op == "6"{
            print("\nHA SALIDO DEL SISTEMA")
            
        }else{
            print("\nOPCION INVALIDA")
            mainAgent()
        }
       
    }




func start(){

    let (idUser, type):(Int, Int) = logIn() // SE VERIFICA EL LOGIN

    if type == 1{
        for c in clients{
            if c.getId() == idUser{
                client = c
            }
        }
        mainClient()
        start()
    }else if type == 2{
        for a in agents{
            if a.getId() == idUser{
                agent = a
            }
        }
        mainAgent()
        start()
    }else{
        print("Inicio Erroneo")
        start()

    }
    
}

start()

