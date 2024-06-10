import GildedRose

private let itemsRepository = ItemsRepository()
private let commandLineProvider = CommandLineProvider()
private let app = GildedRose(items: itemsRepository.items, commandLineProvider: commandLineProvider)

do {
    let report = try app.updateQualityAndReport()
    print(report)
} catch {
    print(error)
}
