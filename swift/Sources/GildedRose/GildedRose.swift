public class GildedRose: GildedRoseUpdating {
    enum NoItemsError: Error {
        case noItems
    }

    public var items: [Itemable]
    private var commandLineProvider: CommandLineProviding

    public init(items: [Itemable], commandLineProvider: CommandLineProviding) {
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
                        \n
                          NAME: \(item.name)
                          DAYS LEFT: \(item.sellIn)
                          QUALITY: \(item.quality)
                          ________________________
                        """
                    if let updatableItem = item as? Updatable {
                        updatableItem.update()
                    }
                }

            }
            return report
        } catch {
            throw error
        }
    }
}
