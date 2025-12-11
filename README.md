📘 Purchase Order Management System – CAP Project

A complete end-to-end Procurement Lifecycle implemented using SAP CAP (Node.js) including:

Vendor Master

Material Master

Purchase Orders (Header + Items)

Goods Receipt (Header + Items)

Invoices (Header + Items)

Audit logging

Segregated OData Services

📁 Project Structure
project-root/
│
├── db/
│   ├── schema.cds                   # Main data model (PO, Vendor, GR, INV, Audit)
│   ├── csv/                         # Master & transactional CSV mock data
│
├── srv/
│   ├── po-service.cds               # Purchase Order Service (PO Header/Item + Audit)
│   ├── md-service.cds               # Vendor & Material Master service
│   ├── gr-service.cds               # Goods Receipt service
│   ├── inv-service.cds              # Invoice service
│   └── handlers.js (optional)       # Custom logic (actions, validations, events)
│
├── package.json
├── README.md                        # ← you are here
└── .gitignore

🧱 Data Model Overview

The schema.cds defines all entities under namespace:

namespace po.ust;

Master Data

vendormaster

mastermaterial

Purchase Order

poheader

poitem

Goods Receipt

gr_header

gr_item

Invoice

inv_header

inv_item

Audit Log

audit

Custom Types Included

addresses

material_type

uom

currency

quantity

payment_terms

post_aspect

audit_aspect

Enums: status, report_status

🚀 OData Services Exposed
📌 1. Purchase Order Service (/po)

File: srv/po-service.cds

Exposes:

Entity	Description
POHeaders	Purchase Order Header
POItems	Purchase Order Items
POAudits	Audit Logs

Endpoints:

/po/POHeaders
/po/POItems
/po/POAudits

📌 2. Master Data Service (/md)

File: srv/md-service.cds

Exposes:

Entity	Description
Vendors	Vendor Master
Materials	Material Master

Endpoints:

/md/Vendors
/md/Materials

📌 3. Goods Receipt Service (/gr)

File: srv/gr-service.cds

Exposes:

Entity	Description
GRHeaders	GR Header
GRItems	GR Item

Endpoints:

/gr/GRHeaders
/gr/GRItems

📌 4. Invoice Service (/inv)

File: srv/inv-service.cds

Exposes:

Entity	Description
InvoiceHeaders	Invoice Header
InvoiceItems	Invoice Items

Endpoints:

/inv/InvoiceHeaders
/inv/InvoiceItems

📊 Associations & Compositions

Your model supports full navigation:

🏷 Purchase Order

POHeader → Vendor (to_vendormaster)

POHeader → POItems (to_poitem)

POItem → Material (to_materialmaster)

POItem → GR Items (to_gr_items)

POItem → Invoice Items (to_invoice_items)

📦 Goods Receipt

GRHeader → GRItems (to_gr_items)

GRHeader → POHeader (to_poheader)

GRItem → POItem (to_po_items)

🧾 Invoice

InvoiceHeader → Vendor (to_vendor)

InvoiceHeader → InvoiceItems (to_inv_items)

InvoiceItem → POItem (to_po_items)

InvoiceItem → GRItem (inv_item_refgr)

📚 Mock Data (CSV)

Place CSV files in:

db/csv/


Example names:

po-ust-vendormaster.csv
po-ust-mastermaterial.csv
po-ust-poheader.csv
po-ust-poitem.csv
po-ust-gr_header.csv
po-ust-gr_item.csv
po-ust-inv_header.csv
po-ust-inv_item.csv
po-ust-audit.csv

▶️ Run the Application
1️⃣ Install dependencies
npm install

2️⃣ Start CAP server
cds watch


CAP UI will open at:

http://localhost:4004