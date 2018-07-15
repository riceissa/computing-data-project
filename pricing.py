#!/usr/bin/env python3

def total_cost_bounds(storage_used, pricing_table):
    """Here the pricing table is given as the upper bounds of each tier."""
    total = 0
    prev_bound = 0
    for bound, rate in pricing_table:
        used = storage_used - prev_bound if bound is None else min(bound, storage_used) - prev_bound
        print(f"adding {used}*{rate}={used*rate} to total")
        total += used * rate
        if bound is None or bound > storage_used:
            break
        prev_bound = bound
    return total

def total_cost_intervals(storage_used, pricing_table):
    """Here the pricing table is given as interval lengths."""
    total = 0
    for interval_size, rate in pricing_table:
        used = storage_used if interval_size is None else min(interval_size, storage_used)
        storage_used -= used
        print(f"adding {used}*{rate}={used*rate} to total")
        total += used * rate
        if storage_used <= 0:
            break
    return total

assert abs(total_cost_bounds(400, [(50, 0.023), (500, 0.022), (None, 0.021)]) - 8.85) < 0.00001
assert abs(total_cost_intervals(400, [(50, 0.023), (450, 0.022), (None, 0.021)]) - 8.85) < 0.00001

assert abs(total_cost_bounds(510, [(50, 0.023), (500, 0.022), (None, 0.021)]) - 11.26) < 0.00001
assert abs(total_cost_intervals(510, [(50, 0.023), (450, 0.022), (None, 0.021)]) - 11.26) < 0.00001

assert abs(total_cost_bounds(25, [(1, 0.12*1024), (10, 0.11*1024), (None, 0.08*1024)]) - (122.88 + 1013.76 + 1228.80)) < 0.00001
assert abs(total_cost_intervals(25, [(1, 0.12*1024), (9, 0.11*1024), (None, 0.08*1024)]) - (122.88 + 1013.76 + 1228.80)) < 0.00001
