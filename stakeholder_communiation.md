# Data Quality Findings, Questions, and Next Steps

Hi [Stakeholder’s Name],

Hope your day is going well!

I wanted to update you on my initial analysis and share some observations along with a few questions that will help us optimize our data assets and analytics moving forward.

## Key Findings

- **Average Spend Analysis:**  
  For receipts with a “rewards receipt status” of “accepted or rejected,” the “accepted” (represented as “FINISHED”) receipts have an average spend of **$80.85**, while “rejected” receipts average **$23.33**.

- **Total Items Purchased:**  
  When comparing total item counts, “accepted” receipts (FINISHED) show a total of **8,184** items versus **173** for “rejected” receipts.

Based on these results, it appears that our receipt-level data is reliable for these analyses. However, I encountered some data quality issues that prevented me from confidently addressing other business questions, especially those related to brand-level performance. Specifically, I noticed inconsistencies in the way brand-related receipt data is captured—which has limited my ability to draw broader conclusions.

## Questions About the Data

- What are the primary sources of this data (e.g., mobile app, website, in-store scanners)?
- Have there been any recent changes in the receipt or item processing workflows that might explain some data gaps?
- Is there a defined measurement framework or documented business rules for awarding points?
- Regarding brand identifiers: Should brand codes and barcodes be considered consistent identifiers across our systems?
- Who are the main stakeholders relying on these analytics, and what decisions are they looking to support?

## To Resolve These Data Quality Issues, I Would Need

- Documentation on the data collection process and any recent changes that might impact the data.
- Detailed business rules for matching items to brands.
- Access to sample physical receipts to validate the digital interpretations.
- Clear confirmation of which fields are the reliable identifiers across our systems.
- Prioritization guidelines on which data quality issues most significantly impact business decisions.

## Additional Information to Optimize Our Data Assets

- Insights into the anticipated analytics use cases.
- Expected data volume growth over the next 6-12 months.
- The required refresh frequency (e.g., real-time, daily, weekly).
- How these analytics will integrate with other business systems.
- Any compliance or data retention requirements (e.g., CCPA, GDPR).

## Production and Performance Considerations

- We plan to implement a dimensional model optimized for analytical queries.
- Receipt data will be partitioned by date to optimize query performance.
- Pipelines will be developed to process only new or changed data efficiently.
- We’ll establish materialized views and indexes for common query patterns.
- Automated data quality and performance monitoring will be set up to proactively catch issues.

I’d appreciate the opportunity to discuss these findings and questions further. With your input on the above points, we can ensure our analytics are built on high-quality data and deliver the best possible insights for the business.

Best Regards,  
Christian Rakotoarisoa
