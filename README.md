# 💳 Credit & Debit Transaction Analytics (MySQL Project)

## 📊 Project Summary

This MySQL-based project focuses on transaction analysis from a bank’s credit and debit logs. It delivers insights into transaction behavior, volume patterns, bank and branch performance, and potential high-risk activity detection.

---

## 💡 Problem Statement

Banks struggle to:
- Monitor transaction patterns across branches and customers.
- Track daily, weekly, and monthly transaction volume.
- Detect anomalies like suspicious transactions or account misuse.
- Understand deposit vs. withdrawal dynamics and channel usage.

---

## 🎯 Objectives

- Analyze transaction volumes and amounts for credit and debit types.
- Calculate credit-to-debit ratios, net cash flow.
- Identify high-frequency and high-value transactions.
- Profile branches, banks, and transaction methods.
- Track activity distribution over time (days, weeks, months).

---

## 🧰 Tools Used

- **MySQL** – Advanced SQL for data querying and transformation.
- **Power BI** – Dashboard visuals (not included here).
- **PowerPoint** – Summary presentation for stakeholders.

---

## 📌 Key KPIs Derived

| KPI                           | Description                                                   |
|------------------------------|---------------------------------------------------------------|
| Total Credit Amount           | Deposits into the bank system.                               |
| Total Debit Amount            | Withdrawals or outflow.                                      |
| Credit/Debit Ratio            | Measures liquidity vs liability.                             |
| Net Transaction Amount        | Cash inflow - outflow.                                       |
| Account Activity Ratio        | Transaction frequency relative to balance.                   |
| Transactions by Timeframe    | Daily, Weekly, Monthly volume analytics.                     |
| Top Branches & Banks          | High-performing units.                                       |
| Transaction Method Usage      | Cash, Card, Bank Transfer, etc.                             |
| Suspicious Transactions       | Customers exceeding defined risk thresholds.                 |

---

## 📁 SQL Highlights

- **Transaction Types**: Grouped by `Credit` or `Debit`.
- **Views**: Created reusable views for suspicious activity analysis.
- **Time Dimension**: Used `DAY()`, `MONTHNAME()`, `WEEK()` for pattern analysis.
- **Branch/Bank Analysis**: Identified locations driving the most transactions.
- **Anomaly Detection**: Used `HAVING` clauses to isolate high-value activity.

---

## 📌 Use Cases for Stakeholders

- **Risk Team**: Identify customers with suspicious volumes.
- **Branch Managers**: Compare performance and customer activity.
- **Marketing**: Promote frequently used transaction methods.
- **Finance Executives**: Understand cash flow health via credit/debit ratios.

---

## 📎 File Structure

- `Loan Analytics.pptx` – Requirements provided by Stakeholders.
- `Credit_and_Debit_Analysis.sql` – All SQL queries and transformations.
- `Loan Analytics.pptx` – Shared summary deck for stakeholders.

---

## 📈 Sample Insights

- X branch processed the highest transaction volume.
- Transaction methods like Bank Transfer accounted for over Y%.
- Z customers flagged as suspicious due to unusually high transaction counts.

---
