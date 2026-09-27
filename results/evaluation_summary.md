# Evaluation Summary

This project evaluates 10 representative failure modes in AI-generated Oracle SQL:
GROUP BY errors, join multiplication, incorrect latest-row logic, NULL semantics,
NOT IN with NULL, nondeterministic ranking, SUM(DISTINCT) misuse, correlated
aggregation scalability, functions on indexed columns, and incomplete business logic.

## Main Finding
AI-generated SQL can look plausible while still being syntactically invalid, logically
wrong, nondeterministic, incomplete, or unsuitable for enterprise-scale execution.
Reliable evaluation requires independent reasoning about data grain, business rules,
Oracle semantics, edge cases, and performance.

## Confidentiality
All schemas, data, names, identifiers, metrics, and scenarios are fictional and synthetic.
No employer, client, production, or proprietary information is included.
