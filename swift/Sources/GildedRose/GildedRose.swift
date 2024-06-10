public class GildedRose {
    private var items: [ItemProtocol]

    public init(items: [ItemProtocol]) {
        self.items = items
    }

    public func updateQuality() {
        items.forEach { item in
            guard let updatableItem = item as? Updatable else { return }
            updatableItem.update()
        }
    }
}
