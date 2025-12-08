---
title: "Week 9 Worklog"
date: "`r Sys.Date()`"
weight: 1
chapter: false
pre: " <b> 1.9. </b> "
---


### Week 9 Objectives:

* Learn to deploy, configure, secure, and clean up AWS compute, database, and storage resources.
* Build practical experience with:
   - VPC networking, security groups, and subnet groups
   - EC2 provisioning, connectivity, and management tools
   - RDS setup, configuration, and backup/restore process
   - Database migration (SQL Server, Oracle → Aurora MySQL)
   - Data analytics pipeline (S3 → Firehose → Glue → Athena → QuickSight)
   - DynamoDB, backup, advanced design patterns, and serverless integration
* Understand AWS cost allocation, tagging strategy, and database configuration fundamentals.
* Develop troubleshooting ability through real migration scenarios and serverless operations.


### Tasks to be carried out this week:
| Day | Task                                                                                                                                                                                                                                                                                                                                                                                                                  | Start Date | Completion Date | Reference Material                  |
| --- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | --------------- | ----------------------------------- |
| 2   | - **Practice:** <br>&emsp; + Create a VPC <br>&emsp;+Create EC2 security group <br>&emsp;+Create RDS security group <br>&emsp;Create DB subnet group<br>&emsp; + Create EC2 instance <br>&emsp;+Create RDS database instance <br>&emsp;+ Application deployment <br>&emsp;+ Back up and restore <br>&emsp;+Clean up Resource                                                                                          | 11/03/2025 | 11/04/2025      | <https://000005.awsstudygroup.com/> |
| 3   | -**Practice:** <br>&emsp; + EC2 Connect RDP Client <br>&emsp; + Conduct Fleet Manager<br>&emsp; + SQLSrv Src config <br>&emsp; +Oracle connect SrcDB<br>&emsp; + Oracle config SrcDB <br>&emsp; + Drop Constraint <br>&emsp; + MSSQL to aur MySQL create project <br>&emsp; + Create Mig Task and Endpoint <br>&emsp; +Inspect S3 <br>&emsp;+ Create Serverless Migration  <br>&emsp;+Troubleshoot test Scenario <br> | 11/04/2025 | 11/05/2025      | <https://000043.awsstudygroup.com/> |
| 4   | - **Practice:** <br>&emsp;+ Create S3 <br>&emsp; + Creating a delivery Stream <br>&emsp; + Create a sample data <br>&emsp; + Create Glue Crawler <br> &emsp; + Data check <br>&emsp;+S3 store output <br>&emsp;+Session connect setup  <br>&emsp;+ Analysis with Athena <br>&emsp;+Visualize with QuickSight <br>&emsp;+ Clean up resource                                                                           | 11/05/2025 | 11/06/2025      | <https://000035.awsstudygroup.com/> |
| 5   | - **Practice:** <br>&emsp; + Hands-on Labs for Amazon DynamoDB <br>&emsp; + Explore dynamo DB <br>&emsp; +Create backup <br>&emsp; + Clean up resources <br> - Practice advance design patterns for DynamoDB <br> - Build and deploy a serverless with dynamoDB  <br>&emsp; + Add event driver                                                                                                                        | 11/06/2025 | 11/07/2025      | <https://000039.awsstudygroup.com/> |
| 6   | - **Practice:** <br>&emsp; + Create database <br>&emsp; + Build a database <br>&emsp; + tagging and cost allocation                                                                                                                                                                                                                                                                                                   | 11/07/2025 | 11/08/2025      | <https://000040.awsstudygroup.com/> |


### Week 9 Achievements:

* Successfully created core AWS infrastructure:
  * VPC, EC2 security group, RDS security group, DB subnet group
  * EC2 instance and RDS database instance
* Completed application deployment and performed backup/restore operations.
* Practiced resource cleanup to avoid unnecessary costs.
* Connected EC2 using RDP and explored management via Fleet Manager.
* Configured SQL Server Source DB and Oracle Source DB, including constraint management.
* Created a migration project and executed migration tasks and endpoints for MSSQL → Aurora MySQL.
* Inspected S3 and built a Serverless Migration workflow.
* Practiced troubleshooting migration scenarios.
