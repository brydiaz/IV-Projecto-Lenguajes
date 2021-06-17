import Foundation

class Control{

    init(){
    }
    
    public func getDataJson(value:String)->[[String: Any]]{
        var cpath = Bundle.main.resourcePath!
        cpath =  cpath.replacingOccurrences(of: ".build/x86_64-unknown-linux-gnu/debug", with: "", options: NSString.CompareOptions.literal, range: nil)
        let path = cpath+"Sources/nCFL/dataBase.json"
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let jsonRead = jsonResult[value] as? [Any] {
                    let jsonTransformed = jsonRead.compactMap{ $0 as? [String: Any] }
                    return jsonTransformed
            }
        } catch {
            print("ERROR LEYENDO EL JSON")
            
        }
        return [["e":-1]]
        
    }


    public func getClients(value:[[String:Any]], value2:[ElectricMeter])->[Client]{
        var clients:[Client] = []
        for client in value{
            let id:Int = client["id"]! as! Int
            let name:String = client["name"]! as! String
            let password:String = client["password"]! as! String 
            let metersId:[Int] = client["metersId"]! as! [Int]
            let clientToSave:Client = Client(id:id, name:name, password:password)
            clientToSave.setMetersIds(value:metersId)
            for i in clientToSave.getMetersIds(){
                for j in value2{
                    if i == j.getId(){
                        clientToSave.addMeter(meter:j)
                    }
                }
            }
    
            clients.append(clientToSave)
        }
        return clients
    }

    public func getMeters(value:[[String:Any]], value2:[Register])->[ElectricMeter]{
        var meters:[ElectricMeter] = []
        for meter in value{
            let id:Int = meter["idMeter"]! as! Int
            let type:String = meter["type"]! as! String
            let consumption:Double = meter["consumption"]! as! Double
            let meterToSave:ElectricMeter = ElectricMeter(idMeter:id,type:type,consumption:consumption)
            for register in value2{
                if register.getIdMeter() == id{
                    meterToSave.addRegister(value:register)
                }
            }
            meters.append(meterToSave)
        }
        return meters
    }

    public func getAgents(value:[[String:Any]])->[AgentService]{
        var agents:[AgentService] = []
        for agent in value{
            let id:Int = agent["id"]! as! Int
            let name:String = agent["name"]! as! String
            let password:String = agent["password"]! as! String
            let agentToSave:AgentService = AgentService(id:id, name:name, password:password)
            agents.append(agentToSave)
        }
        return agents
    }

    public func getRegisters(value:[[String:Any]])->[Register]{
        var registers:[Register] = []
        for register in value{
            let id:Int = register["idRegister"]! as! Int
            let meterId:Int = register["idMeter"]! as! Int
            let penI:Int = register["pending"]! as! Int
            var isOrNot:Bool = false
            if(penI==1){
                isOrNot = true
            }
            let paidAmount:Double = register["paidAmount"]! as! Double
            let pendingAmout:Double = register["pendingAmout"]! as! Double

            let registerToSave = Register(idRegister:id, idMeter:meterId, pending:isOrNot, paidAmount:paidAmount,pendingAmout:pendingAmout)
            registers.append(registerToSave)
            
            
        }
        return registers
    }
    public func logIn(clients:[Client],agents:[AgentService])->(Int, Int){
        print("\nBienvenido al Sistema.\nIdentificate!\n")
        print("ID:")
        let id = Int(readLine()!)
        print("PASSWORD: ")
        let password = String(readLine()!)
        var clientTemp:Client?
        var agentTemp:AgentService?

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
            let op = Int(readLine()!)
            if op == 1{
                print("LOGIN COMO USUARIO")
                if clientTemp!.getPassword() == password{
                    print("Bienvenido ",clientTemp!.getName())
                    return (clientTemp!.getId(), 1)
                }else{
                    print("ERROR EN EL PASSWORD, VUELVE A TRATAR")
                    logIn(clients:clients, agents:agents)
                }
            }else if op == 2{
                print("LOGIN COMO AGENTE")
                if agentTemp!.getPassword() == password{
                    print("Bienvenido ",agentTemp!.getName())
                    return (agentTemp!.getId(), 2)
                }else{
                    print("ERROR EN EL PASSWORD, VUELVE A TRATAR")
                    logIn(clients:clients, agents:agents)
                }
                
            }else{
                print("OPCION INVALIDA, VUELVE A TRATAR")
                logIn(clients:clients, agents:agents)
            }
        }else if clientTemp != nil && agentTemp == nil{
            print("LOGIN COMO USUARIO")
            if clientTemp!.getPassword() == password{
                    print("Bienvenido ",clientTemp!.getName())
                    return (clientTemp!.getId(), 1)
            }else{
                print("ERROR EN EL PASSWORD, VUELVE A TRATAR")
                logIn(clients:clients, agents:agents)
            }

        }else if clientTemp == nil && agentTemp != nil{
            print("LOGIN COMO AGENTE")
            if agentTemp!.getPassword() == password{
                    print("Bienvenido ",agentTemp!.getName())
                    return (agentTemp!.getId(), 2)
            }else{
                print("ERROR EN EL PASSWORD, VUELVE A TRATAR")
                logIn(clients:clients, agents:agents)
            }
        }else{
            print("NO CORRESPONDEN SUS DATOS A NADIE")
            print("1. SALIR 2. REINTENTAR")
            let op = Int(readLine()!)
            if op == 1{
                //Aca salimos
            }else if op == 2{
                logIn(clients:clients, agents:agents)
            }else{
                print("OPCION INVALIDA, CIERRE DE PROGRAMA")
            }

           
        }

        return (0, -1)


    }

    public func mainClient(client:Client, appeals:[Appeal]){
        print("\nMenú Cliente\n")
        print("1. Ver registros de los medidores asociados")
        print("2. Pagar algún registro pendiende por ID")
        print("3. Apelar algún registro por ID")
        print("4. Salir")

        let op = String(readLine()!)
        if op == "1"{
            print("\nACA MOSTRARIA LOS REGISTROS")
            //
            print("\n")
            mainClient(client:client, appeals:appeals)
            
        }else if op == "2"{
            print("\nACÁ SE PAGARÍA ALGUN REGISTRO PENDIENTE")
            //
            print("\n")
            mainClient(client:client, appeals:appeals)
        }else if op == "3"{
            print("\nACÁ SE HARÍA LAS APELACIONES")
            //
            print("\n")
            mainClient(client:client, appeals:appeals)
        }else if op == "4"{
            print("\nGRACIAS POR USAR")
        }else{
            print("\nOPCION INVALIDA")
            mainClient(client:client, appeals:appeals)
        }
    }

    public func mainAgent(agent:AgentService,clients:[Client],meters:[ElectricMeter],registers:[Register], appeals:[Appeal]){
        print("\nMenú agente\n")
        print("1. Ver registros y medidores")
        print("2. Ver apelaciones")
        print("3. Trabajar apelacion por ID")
        print("4. Arreglar medidor")
        print("5. Salir")

        let op = String(readLine()!)
        if op == "1"{
            print("\nACA MOSTRARIA LOS REGISTROS")
            //
            print("\n")
            mainAgent(agent:agent,clients:clients,meters:meters,registers:registers, appeals:appeals)
            
        }else if op == "2"{
            print("\nACÁ MOSTRARIA APELACIONES")
            //
            print("\n")
            mainAgent(agent:agent,clients:clients,meters:meters,registers:registers, appeals:appeals)
        }else if op == "3"{
            print("\nACÁ SE ARREGLA UNA APELACION POR ID")
            //
            print("\n")
            mainAgent(agent:agent,clients:clients,meters:meters,registers:registers, appeals:appeals)
        }else if op == "4"{
            print("\nACÁ SE ARREGLA UN MEDIDOR POR ID")
            //
            print("\n")
            mainAgent(agent:agent,clients:clients,meters:meters,registers:registers, appeals:appeals)
        }else if op == "5"{
            print("\nGRACIAS POR USAR")
        }else{
            print("\nOPCION INVALIDA")
            mainAgent(agent:agent,clients:clients,meters:meters,registers:registers, appeals:appeals)
        }

    }

}
