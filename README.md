# RESTful Booker — Technical Business Analysis & API Solution Design

## Project Overview
This repository presents my self-directed **Technical Business Analysis project**, using the RESTful Booker Platform as a case study. The project aims to investigate an existing hotel reservation system, identify business and technical limitations, and propose improvements through requirements engineering, process modelling, API contract design, and testing. Rather than developing a new backend, the project focuses on bridging the gap between **business requirements and technical solutions**.

## Project Objectives
- Analyse the existing (AS-IS) system and document its API functionalities.
- Identify business and technical gaps affecting the reservation process.
- Translate business needs into requirements, business rules, user stories, and acceptance criteria.
- Develop improved (TO-BE) business processes and API contracts.
- Design test cases and maintain requirements traceability.
- Simulate the proposed API responses and document testing limitations.
- Proposed API-related features to improve and resemble modern APIs. 

## Project Methodology
The project follows a structured Technical Business Analysis approach:
**AS-IS Investigation → Requirements Analysis → Gap Analysis → TO-BE Design → API Contract Specification → Mock Verification & API improvement recommendations**

### 1. AS-IS System Investigation
- Explored the existing RESTful Booker API architecture and endpoints.
- Used Postman to execute API requests and investigate response behaviour.
- Examined Spring Boot controller definitions using Bash commands.
- Documented existing business requirements, functional requirements, and test cases.
- Recorded observed API failures and potential system limitations.

### 2. Gap Analysis
Identified four principal areas for improvement:
| Gap ID | Identified Area | Proposed Improvement |
|---|---|---|
| GAP-001 | Cancellation & Refund Management | Introduce cancellation approval workflows, refund eligibility rules, and refund tracking. |
| GAP-002 | Reservation Modification & Pricing | Support changes to reservation dates and rooms, availability checks, price recalculation, and payment adjustments. |
| GAP-003 | Authentication & Authorisation | Strengthen customer reservation ownership verification, staff permissions, and secure logout. |
| GAP-004 | API Reliability & Error Handling | Improve endpoint reliability, response consistency, validation, and error handling. |

### 3. Requirements Engineering & Process Modelling
Developed supporting business analysis artefacts, including:
- Business Requirements (BR)
- Business Rules
- Functional Requirements (FR)
- User Stories & Acceptance Criteria
- Test Case Registers
- Requirements Traceability Matrix (RTM)
- BPMN Process Diagrams
- System Context Diagram
- TO-BE User Story Map
These artefacts help establish traceability between business needs, proposed system behaviour, and verification activities.

### 4. API Contract Design
Designed **15 REST API contracts** using Swagger/OpenAPI 3.0.3, including new operations and enhancements to existing endpoints.
The API contracts define:
- HTTP methods and endpoint paths
- Authentication and authorisation requirements
- Request headers, parameters, and JSON bodies
- Response structures and HTTP status codes
- Error handling and validation scenarios
- References to acceptance criteria and test cases
Existing contracts were also revised to support requirements spanning multiple functional gaps.

### 5. API Testing & Mock Verification
Used **Postman** to investigate existing APIs and simulate proposed TO-BE behaviour. We can also use **BASH** here to investigate existing and proposing APIs.
Activities included:
- Executing AS-IS API requests.
- Inspecting HTTP response codes and JSON payloads.
- Preparing automated API assertions.
- Creating Postman Mock Servers for proposed API contracts.
- Simulating successful and unsuccessful response scenarios.
- Performing additional API investigations and automated testing using Bash, `curl`, and `jq`.
**Important:** The TO-BE APIs are proposed designs. Mock testing demonstrates predefined response examples but does not verify backend business logic, database updates, real payment processing, or security enforcement.

## Tools & Technologies
| Tool / Technology | Application |
|---|---|
| Swagger / OpenAPI 3.0.3 | API contract design and documentation |
| Postman | API testing, request collections, and mock response verification |
| Bash / curl / jq | API investigation, response analysis, and test automation |
| Git & GitHub | Version control and technical portfolio |
| Lucidspark | Process modelling, diagrams, and user story mapping |
| Google Docs | Business analysis documentation and requirements traceability |
| Spring Boot (source inspection) | Understanding existing backend endpoint definitions |

## Repository Contents
This repository contains the technical specifications, testing scripts, process models, and business analysis documentation developed throughout the RESTful Booker Technical BA project.
| File | Description |
|---|---|
| [README.md](README.md) | Project overview, methodology, scope, tools, and key learning outcomes. |
| [as-is-postman-collection.json](as-is-postman-collection.json) | Postman collection used to investigate and test existing AS-IS API functionality. |
| [to-be-postman-collection.json](to-be-postman-collection.json) | Postman collection containing proposed TO-BE API requests, response examples, and mock testing scenarios. |
| [to-be-openapi.yaml](to-be-openapi.yaml) | OpenAPI 3.0.3 specification documenting 15 proposed API designs, including revised and enhanced operations. |
| [automating-api-test.sh](automating-api-test.sh) | Bash script for automated API testing and validation of HTTP responses. |
| [common-script-api-report.sh](common-script-api-report.sh) | Reusable Bash API test runner supporting configurable endpoints, HTTP methods, authentication, JSON checks, and CSV reporting. |
| [gap-analysis.pdf](gap-analysis.pdf) | Documentation of the four identified business and technical gaps, including proposed improvements. |
| [to-be-api-design & documentation.pdf](to-be-api-design%20%26%20documentation.pdf) | Detailed TO-BE API design documentation, covering endpoints, HTTP methods, request and response structures, and related requirements. |
| [context-diagram.png](context-diagram.png) | High-level system context showing interactions between the Room Booking System and external entities. |
| [bpmn-level 1-diagram.png](bpmn-level%201-diagram.png) | High-level BPMN process model representing the major business activities. |
| [bpmn-level 2-diagram-request-for-cancellation.png](bpmn-level%202-diagram-request-for-cancellation.png) | Detailed BPMN model of the proposed reservation cancellation workflow. |
| [bpmn-level 2-digram-modifying-reservation-details.png](bpmn-level%202-digram-modifying-reservation-details.png) | Detailed BPMN model of the proposed reservation modification workflow. |
| [user-stories-map.png](user-stories-map.png) | TO-BE user story map illustrating the relationships between business activities and user requirements. |

### How to Explore the Repository
Readers interested in **Business Analysis** can begin with the Gap Analysis, Context Diagram, BPMN models, and User Story Map.
Readers interested in **API Design** can examine the OpenAPI specification and the TO-BE Postman collection.
Readers interested in **API Testing and Automation** can explore the AS-IS Postman collection and Bash testing scripts.
Together, these deliverables demonstrate the process of translating identified business problems into structured requirements, proposed API contracts, and testable technical specifications.

## How to Explore the Postman Collection
1. Download `to-be-postman-collection.json` or `as-is-postman-collection.json` from this repository.
2. Open Postman and select **Import**.
3. Import the JSON collection.
4. Explore the API endpoints, request bodies, authentication specifications, and saved response examples.
5. To simulate the TO-BE APIs, create a collection-based Postman Mock Server and configure the `baseUrl` environment variable with its URL.
Some saved responses can be selected through the `x-mock-response-code` request header.
A mock server must be configured separately; it is not hosted or deployed by importing the collection alone.

## Project Scope & Limitations
This is an **independent educational and portfolio project**, not an official implementation of the RESTful Booker Platform.
- No production backend modifications were made.
- TO-BE APIs were designed and simulated rather than implemented.
- Business rules and proposed workflows have not received formal approval from real hotel stakeholders.
- Actual payment gateway transactions were not performed.
- Full integration, security, and performance testing of the proposed TO-BE functionality remains outside the current project scope.
The deliverables are intended to demonstrate a structured Technical BA approach and provide a foundation for potential future development.

## Key Learning Outcomes
Through this project, I strengthened my understanding of:
- Translating business problems into technical requirements in general, and API specificly.
- Analysing existing systems and identifying functional gaps.
- Designing API contracts aligned with business rules and acceptance criteria.
- Applying requirements traceability throughout solution design.
- Investigating API behaviour through both graphical tools and command-line utilities.
- Distinguishing proposed API behaviour from implemented and verified functionality.
- Applying modern API features to assist RESTful Booker in adopting a modern API system.
**The main takeaway:** Technical Business Analysis requires connecting business objectives, system behaviour, technical constraints, and testable requirements to create implementable solutions.

---

**This project independently analyses the publicly available RESTful Booker Platform. The underlying application and its original source code belong to their respective creators. The proposed business analysis artefacts and TO-BE API contract designs represent independent case-study work.**
