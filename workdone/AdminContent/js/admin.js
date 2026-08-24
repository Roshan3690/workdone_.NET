/* ==========================================================================
   WorkDone Admin Panel - Custom JavaScript
   Interactive functionality, sidebar toggles, search filters, notifications
   ========================================================================== */

document.addEventListener("DOMContentLoaded", function () {
    // 1. Sidebar Toggle for Mobile & Desktop
    const sidebarToggleBtn = document.getElementById("sidebarToggle");
    const adminSidebar = document.getElementById("admin-sidebar");
    const sidebarOverlay = document.getElementById("sidebarOverlay");

    if (sidebarToggleBtn && adminSidebar) {
        sidebarToggleBtn.addEventListener("click", function (e) {
            e.preventDefault();
            adminSidebar.classList.toggle("sidebar-open");
            if (sidebarOverlay) {
                sidebarOverlay.classList.toggle("active");
            }
        });
    }

    if (sidebarOverlay && adminSidebar) {
        sidebarOverlay.addEventListener("click", function () {
            adminSidebar.classList.remove("sidebar-open");
            sidebarOverlay.classList.remove("active");
        });
    }

    // 2. Client-Side Table Search Filter Utility
    const searchInputs = document.querySelectorAll("[data-table-search]");
    searchInputs.forEach(input => {
        input.addEventListener("keyup", function () {
            const targetTableId = this.getAttribute("data-table-search");
            const targetTable = document.getElementById(targetTableId);
            if (!targetTable) return;

            const searchTerm = this.value.toLowerCase().trim();
            const rows = targetTable.querySelectorAll("tbody tr");

            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchTerm)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        });
    });

    // 3. Client-Side Category / Status Filter Utility
    const statusFilters = document.querySelectorAll("[data-table-filter]");
    statusFilters.forEach(select => {
        select.addEventListener("change", function () {
            const targetTableId = this.getAttribute("data-table-filter");
            const filterAttr = this.getAttribute("data-filter-field") || "status";
            const targetTable = document.getElementById(targetTableId);
            if (!targetTable) return;

            const selectedValue = this.value.toLowerCase();
            const rows = targetTable.querySelectorAll("tbody tr");

            rows.forEach(row => {
                const rowValue = (row.getAttribute("data-" + filterAttr) || "").toLowerCase();
                if (selectedValue === "all" || selectedValue === "" || rowValue.includes(selectedValue)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        });
    });

    // 4. Quick Action Demo Alerts / Toast Notification Trigger
    window.showAdminAlert = function (message, type = "success") {
        const alertBox = document.createElement("div");
        alertBox.className = `alert alert-${type} alert-dismissible fade show shadow-lg position-fixed`;
        alertBox.style.top = "20px";
        alertBox.style.right = "20px";
        alertBox.style.zIndex = "9999";
        alertBox.style.borderRadius = "0.75rem";
        alertBox.style.minWidth = "300px";
        alertBox.innerHTML = `
            <div class="d-flex align-items-center">
                <i class="bi bi-${type === 'success' ? 'check-circle-fill' : type === 'danger' ? 'exclamation-octagon-fill' : 'info-circle-fill'} fs-5 me-2"></i>
                <div>${message}</div>
                <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        `;
        document.body.appendChild(alertBox);

        setTimeout(() => {
            alertBox.classList.remove("show");
            setTimeout(() => alertBox.remove(), 300);
        }, 3500);
    };

    // 5. Delete Action Confirmations (Demo)
    const deleteButtons = document.querySelectorAll(".btn-delete-row");
    deleteButtons.forEach(btn => {
        btn.addEventListener("click", function (e) {
            e.preventDefault();
            const row = this.closest("tr");
            const itemName = this.getAttribute("data-name") || "this item";
            
            if (confirm(`Are you sure you want to delete "${itemName}"? (Frontend demo)`)) {
                if (row) {
                    row.style.transition = "all 0.3s ease";
                    row.style.opacity = "0";
                    setTimeout(() => {
                        row.remove();
                        window.showAdminAlert(`"${itemName}" was removed successfully.`, "danger");
                    }, 300);
                }
            }
        });
    });

    // 6. Worker / Order Status Switcher (Demo)
    const statusToggles = document.querySelectorAll(".worker-status-toggle");
    statusToggles.forEach(toggle => {
        toggle.addEventListener("change", function () {
            const isChecked = this.checked;
            const workerName = this.getAttribute("data-worker-name") || "Worker";
            const badge = document.getElementById(this.getAttribute("data-badge-id"));
            
            if (badge) {
                if (isChecked) {
                    badge.className = "badge-status badge-status-verified";
                    badge.textContent = "Verified";
                } else {
                    badge.className = "badge-status badge-status-pending";
                    badge.textContent = "Pending";
                }
            }

            window.showAdminAlert(`${workerName} status updated to ${isChecked ? 'Active / Verified' : 'Pending Verification'}.`, isChecked ? "success" : "warning");
        });
    });

    // 7. Form submission demo prevent default and show notification
    const adminForms = document.querySelectorAll(".demo-admin-form");
    adminForms.forEach(form => {
        form.addEventListener("submit", function (e) {
            e.preventDefault();
            const modalEl = this.closest(".modal");
            if (modalEl && typeof bootstrap !== "undefined") {
                const modalInstance = bootstrap.Modal.getInstance(modalEl);
                if (modalInstance) modalInstance.hide();
            }
            window.showAdminAlert("Changes saved successfully (Frontend demo).", "success");
            this.reset();
        });
    });
});
