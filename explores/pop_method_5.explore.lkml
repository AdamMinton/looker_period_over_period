include: "/views/pop_method_5.view.lkml"
include: "/explores/pop_method_3.explore.lkml"

explore: order_items_method_5 {
  label: "PoP Method 5: Compare Current Period with Another Arbitrary Period"
  extends: [order_items_method_3]
  always_filter: {
    filters: [current_date_range: "1 month", previous_date_range: "2 months ago for 2 days"]
  }
}
