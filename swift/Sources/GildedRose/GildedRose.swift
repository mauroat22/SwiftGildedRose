public protocol GildedRoseProtocol: AnyObject {
    var items: [ItemProtocol] { get }
    func updateQualityAndReport() throws -> String
}

public class GildedRose: GildedRoseProtocol {
    enum NoItemsError: Error {
        case noItems
    }

    public var items: [ItemProtocol]
    private var commandLineProvider: CommandLineProviderProtocol

    public init(items: [ItemProtocol], commandLineProvider: CommandLineProviderProtocol) {
        self.items = items
        self.commandLineProvider = commandLineProvider
    }

    public func updateQualityAndReport() throws -> String {
        do {
            let days = try commandLineProvider.getDaysParameter()
            guard !items.isEmpty else { throw NoItemsError.noItems }
            
            var report = ""

            for i in 0 ..< days {
                report += "\n\n-------- day \(i) --------\n\n"
                for item in items {
                    report +=
                            """
                          NAME: \(item.name)
                          DAYS LEFT: \(item.sellIn)
                          QUALITY: \(item.quality)
                          ________________________
                        """
                    guard let updatableItem = item as? Updatable else { break }
                    updatableItem.update()
                }

            }
            return report
        } catch {
            throw error
        }
    }
}
