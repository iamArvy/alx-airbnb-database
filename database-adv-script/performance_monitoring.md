# 🔍 Continuous Database Performance Monitoring Report

## 🎯 Objective
Continuously monitor and refine SQL query performance using EXPLAIN and SHOW PROFILE to identify and resolve bottlenecks.

---

## 🧪 Monitored Queries

1. **User Bookings**

```sql
SELECT * FROM Bookings WHERE user_id = 42 ORDER BY start_date DESC;
```
2. **Properties in a Location**

```sql
SELECT * FROM Properties WHERE location = 'Lagos';
```

3. **Bookings with Payment Status**

```sql
SELECT b.id, b.start_date, p.amount, p.status
FROM Bookings b
JOIN Payments p ON b.payment_id = p.id
WHERE b.date >= '2024-01-01';
```

---

## Bookings with Payment Status

| Query                  | Problem                         |
| ---------------------- | ------------------------------- |
| Bookings by user       | Full scan + filesort            |
| Properties by location | Table scan                      |
| Bookings + Payments    | Join performance, no filter use |

---

## Optimizations Applied
| Change                                                             | Reason                       |
| ------------------------------------------------------------------ | ---------------------------- |
| `CREATE INDEX idx_user_date ON Bookings(user_id, start_date DESC)` | Filter + sort support        |
| `CREATE INDEX idx_location ON Properties(location)`                | Location filter optimization |

===

## Performance Improvements
| Query                  | Before Time | After Time | Rows Scanned          | Notes                |
| ---------------------- | ----------- | ---------- | --------------------- | -------------------- |
| Bookings by user       | \~0.9s      | \~0.1s     | 10,000 → \~50         | Used composite index |
| Properties by location | \~0.5s      | \~0.05s    | 8,000 → \~200         | Used location index  |
| Bookings + Payments    | \~1.2s      | \~0.3s     | Used proper join keys |                      |

---

## Conclusion
- Query plans should be monitored regularly, especially as data grows.
- Composite indexes offer massive gains over single-column indexes for common filter+sort patterns.
- SHOW PROFILE / EXPLAIN is critical in identifying where the optimizer is struggling.