# AI-Assisted Oracle SQL Evaluation Lab

A synthetic technical portfolio demonstrating Oracle SQL evaluation, debugging,
data validation, query optimization, and assessment of AI-generated database solutions.

## What I Built
A small Oracle-style order-management dataset and a 10-case evaluation benchmark.
Each case contains a prompt, an AI candidate answer, an independent review, a corrected
reference solution, a rubric, a validation approach, and a lesson learned.

## How AI Was Used
Generative AI was used as a candidate-solution generator. I then independently reviewed
the outputs for syntax, Oracle compatibility, logical correctness, data grain, NULL
behavior, analytic-function correctness, performance, edge cases, and business-rule completeness.

## What I Learned
AI-generated SQL can be convincing at first glance while still containing subtle logical
or enterprise-readiness defects. Common issues include join multiplication, row-integrity
mistakes, nondeterministic ranking, NULL semantics, incomplete business logic, and
performance patterns that may not scale.

## Structure
- `schema/` synthetic tables and data
- `evaluations/` 10 documented AI SQL evaluations
- `sql/` candidate answers, reference solutions, validation queries
- `results/` summary of recurring failure modes
- `assets/` Handshake preview and project logo

## Confidentiality
All schemas, data, company names, identifiers, metrics, and business rules are fictional
and synthetic. No employer, client, production, or proprietary information is included.

## Skills
Oracle SQL • PL/SQL Reasoning • Query Optimization • Data Validation • Debugging •
Code Review • AI Evaluation • Technical Reasoning • Enterprise Data Modeling
