msg="You must collect all eight Keys in#order to unlock the true ending."

if (
    has_item("Item1") &&
    has_item("Item2") &&
    has_item("Item3") &&
    has_item("Item4") &&
    has_item("Item5") &&
    has_item("Item6") &&
    has_item("Item7") &&
    has_item("Item8")
) instance_destroy()
