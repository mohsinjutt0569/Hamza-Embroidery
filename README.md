# Hamza Fashion Embroidery – E-Commerce & Haute Couture Website

An e-commerce storefront, admin content management portal, and direct WhatsApp booking system for **Hamza Fashion Embroidery**, inspired by modern Pakistani couture and fine craftsmanship.

---

## 🌟 Key Features

### 🛍️ Storefront (`index.html`)
* **Dynamic Product Catalog**: Seamlessly displays embroidered kurtas, unstitched luxury suits, velvet dupattas, and seasonal arrivals.
* **Instant Category Filters**: Filter by *All Collection*, *New Arrivals*, *Unstitched*, *Kurtas*, and *Luxury Embroidery*.
* **Live Search**: Real-time keyword search across titles, categories, and fabric descriptions.
* **Handpicked Suggestions**: Curated recommendation grid showcasing bestsellers and special sales.
* **Responsive Design**: Designed for desktop, tablet, and mobile with sleek red accent `#e21836` styling.

### 📱 WhatsApp Booking & Order Automation (`03033331383`)
* **Floating WhatsApp Button**: Instant direct chat link to `03033331383` with hover tooltip and pulse indicator.
* **Direct Product Ordering**: Every product card has an **"Order via WhatsApp"** button.
* **Smart Booking Modal**:
  * Captures Customer Name, Phone Number, Quantity, Size/Stitching, Delivery Address, and Custom Requests.
  * Generates a structured pre-filled order message sent directly to WhatsApp `03033331383`.
  * Automatically registers the order in the local database for the Admin to track.

### 🛡️ Admin Management Dashboard (`dashboard.html`)
* **Product CRUD**: Add new products, edit existing items, change prices, update images, adjust star ratings, or mark items with a "SALE" badge. All changes show up live on the website!
* **WhatsApp Orders Viewer**: Review customer bookings with customer names, contact numbers, and delivery addresses, plus a one-click **"Chat on WhatsApp"** button.
* **Reset Catalog**: One-click restore button for default sample catalog data.
* **Secured Access**: Protected by Admin role credentials.

---

## 🔑 Default Admin Credentials

| Role | Username / Email | Password |
|---|---|---|
| **Store Administrator** | `admin` | `admin123` |

---

## 🚀 How to Test Locally

### Option 1: One-Click Windows Runner (No Setup Required)
Simply **double-click** `run-server.bat` in the project folder!
* It automatically starts a local zero-dependency HTTP server on port `8080`.
* It opens your default web browser directly to `http://localhost:8080/index.html`.

### Option 2: Using VS Code Live Server
1. Open this folder in **Visual Studio Code**.
2. Right-click `index.html` and select **"Open with Live Server"**.

### Option 3: Python (if installed)
```bash
python -m http.server 8080
```
Then visit: `http://localhost:8080`

### Option 4: Node.js (if installed)
```bash
npx serve .
```

---

## 📂 Project Structure

```text
hamza-fashion-embroidery/
│
├── index.html               # Main customer storefront & WhatsApp booking
├── dashboard.html           # Admin product management & order tracking
├── auth.html                # User & Admin login / registration
│
├── styles.css               # Storefront & responsive styling
├── admin.css                # Admin portal styling & tables
├── auth.css                 # Login & registration card styles
│
├── run-server.bat           # One-click Windows local server launcher
├── server.ps1               # Lightweight PowerShell HTTP server script
│
├── assets/
│   └── product_placeholder.jpg  # Product showcase image asset
│
└── js/
    ├── utils.js             # WhatsApp URL builders, crypto hashing, storage
    ├── products.js          # Product data, CRUD operations, orders storage
    ├── auth.js              # Authentication, admin verification & session
    ├── dashboard.js         # Admin dashboard logic, modal handlers & tables
    └── script.js            # Storefront interactivity, catalog filter & modal
```

---

## 🌐 How to Upload to GitHub

1. Go to [GitHub.com](https://github.com) and click **"New repository"**.
2. Name it (e.g. `hamza-fashion-embroidery`) and click **"Create repository"**.
3. Choose **"uploading an existing file"** link on GitHub.
4. Drag and drop all files from this folder (or the ZIP archive) and click **"Commit changes"**.

### Free Live Hosting on GitHub Pages:
1. In your GitHub repository, go to **Settings** > **Pages**.
2. Under **Build and deployment** > **Branch**, select `main` (or `master`) and `/ (root)`.
3. Click **Save**. Within 1–2 minutes, your website will be live worldwide on:
   `https://<your-username>.github.io/hamza-fashion-embroidery/`

---

## 📞 Business Contact
* **Brand:** Hamza Fashion Embroidery
* **WhatsApp Booking:** `+92 303 3331383` (03033331383)
* **Email:** orders@hamzafashion.com
