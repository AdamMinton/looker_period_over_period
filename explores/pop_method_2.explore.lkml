include: "/views/pop_method_2.view.lkml"

explore: order_items_method_2 {
  label: "PoP Method 2: Any Two Native Timeframes (with Liquid)"
  always_filter: {
    filters: [choose_comparison: "Year", choose_breakdown: "Month"]
  }
}
