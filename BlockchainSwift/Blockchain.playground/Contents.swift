//: Playground - noun: a place where people can play

import Cocoa

//MARK: Smart contract
protocol SmartContract {
    func apply(transaction: Transaction)
}

class TransactionTypeSmartContract: SmartContract {
    func apply(transaction: Transaction) {
        var fees = 0.0
        switch transaction.transactionType {
            case .domestic:
                fees = 0.02
            case .international:
                fees = 0.05
        }
        transaction.fees = transaction.amount * fees
        transaction.amount -= transaction.fees
    }
}

enum TransactionType : String, Codable {
    case domestic
    case international
}

//MARK:  Blockchain Core
class Transaction : Codable {
    var from : String
    var to : String
    var amount : Double
    var fees: Double = 0.0
    var transactionType : TransactionType
    
    init(from: String, to: String, amount: Double, transactionType: TransactionType) {
        self.from = from
        self.to = to
        self.amount = amount
        self.transactionType = transactionType
    }
}

class Block : Codable {
    var index : Int = 0
    var previousHash : String = ""
    var hash : String!
    var nonce : Int
    
    private (set) var transactions: [Transaction] = [Transaction]()
    
    var key : String {
        get {
            let transactionsData = try! JSONEncoder().encode(self.transactions)
            let transactionsJSONString = String(data: transactionsData, encoding: .utf8)
            
            return String(self.index) + self.previousHash + String(self.nonce) + transactionsJSONString!
        }
    }
    
    func addTransaction(transaction: Transaction) {
        self.transactions.append(transaction)
    }
    
    init() {
        self.nonce = 0
    }
}

class Blockchain : Codable {
    private (set) var blocks: [Block] = [Block]()
    private (set) var smartContracts: [SmartContract] = [TransactionTypeSmartContract()]
    
    init(genesisBlock: Block) {
        addBlock(genesisBlock)
    }
    
    private enum CodingKeys: CodingKey {
        case blocks
    }
    
    func addBlock(_ block: Block) {
        if self.blocks.isEmpty {
            block.previousHash = String(repeating: "0", count: 10)
            block.hash = generateHash(for: block)
        }
        
        self.smartContracts.forEach { contract in
            block.transactions.forEach { transaction in
                contract.apply(transaction: transaction)
            }
        }
        
        self.blocks.append(block)
    }
    
    func getNextBlock(transactions: [Transaction]) -> Block {
        let block = Block()
        transactions.forEach { transaction in
            block.addTransaction(transaction: transaction)
        }
        
        let previousBlock = getPreviousBlock()
        block.index = self.blocks.count
        block.previousHash = previousBlock.hash
        block.hash = generateHash(for: block)
        
        return block
    }
    
    private func getPreviousBlock() -> Block {
        return self.blocks.last!
    }
    
    func generateHash(for block: Block) -> String {
        var hash = block.key.sha1Hash()
        
        while(!hash.hasPrefix("0")) {
            block.nonce += 1
            hash = block.key.sha1Hash()
            print(hash)
        }
        
        return hash
    }
}

extension String {
    func sha1Hash() -> String {
        let task = Process()
        task.launchPath = "/usr/bin/shasum"
        task.arguments = []
        
        let inputPipe = Pipe()
        
        inputPipe.fileHandleForWriting.write(self.data(using: String.Encoding.utf8)!)
        inputPipe.fileHandleForWriting.closeFile()
        
        let outputPipe = Pipe()
        task.standardOutput = outputPipe
        task.standardInput = inputPipe
        task.launch()
        
        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let hash = String(data: data, encoding: String.Encoding.utf8)!
        return hash.replacingOccurrences(of: " -\n", with: "")
    }
}

let genesisBlock = Block()
let blockchain = Blockchain(genesisBlock: genesisBlock)
let transtraction = Transaction(from: "Sebastian", to: "Alejandra", amount: 20, transactionType: .international)
let transtraction2 = Transaction(from: "Alejandra", to: "Sebastian", amount: 12, transactionType: .domestic)
print("________________________________________")
let block = blockchain.getNextBlock(transactions: [transtraction])
let block2 = blockchain.getNextBlock(transactions: [transtraction2])
blockchain.addBlock(block)
blockchain.addBlock(block2)

let data = try! JSONEncoder().encode(blockchain)
let blockchainJSON = String(data: data, encoding: .utf8)
print(blockchainJSON!)

