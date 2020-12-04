<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="sdvsd" method="post" accept-charset="utf-8" novalidate="novalidate" class="dirty">
                                             <div class="alert alert-warning bold">
                  Changing role permissions won't affected current staff members permissions that are using this role.                  <div class="checkbox">
                     <input type="checkbox" name="update_staff_permissions" id="update_staff_permissions">
                     <label for="update_staff_permissions">Update all staff members permissions that are using this role</label>
                  </div>
               </div>
                                                                           <div class="form-group" app-field-wrapper="name"><label for="name" class="control-label"> <small class="req text-danger">* </small>Role Name</label><input type="text" id="name" name="name" class="form-control" value="BDE"></div>                <div class="table-responsive">
   <table class="table table-bordered roles no-margin">
      <thead>
         <tr>
            <th>Feature</th>
            <th>Capabilities</th>
         </tr>
      </thead>
      <tbody>
                  <tr data-name="bulk_pdf_exporter">
            <td>
               <b>Bulk PDF Export</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="bulk_pdf_exporter_view" name="permissions[bulk_pdf_exporter][]" value="view">
                  <label for="bulk_pdf_exporter_view">
                  View(Global)                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="contracts">
            <td>
               <b>Contracts</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" type="checkbox" class="capability" id="contracts_view_own" name="permissions[contracts][]" value="view_own">
                  <label for="contracts_view_own">
                  View (Own)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="contracts_view" name="permissions[contracts][]" value="view">
                  <label for="contracts_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="contracts_create" name="permissions[contracts][]" value="create">
                  <label for="contracts_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="contracts_edit" name="permissions[contracts][]" value="edit">
                  <label for="contracts_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="contracts_delete" name="permissions[contracts][]" value="delete">
                  <label for="contracts_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="credit_notes">
            <td>
               <b>Credit Notes</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" type="checkbox" class="capability" id="credit_notes_view_own" name="permissions[credit_notes][]" value="view_own">
                  <label for="credit_notes_view_own">
                  View (Own)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="credit_notes_view" name="permissions[credit_notes][]" value="view">
                  <label for="credit_notes_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="credit_notes_create" name="permissions[credit_notes][]" value="create">
                  <label for="credit_notes_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="credit_notes_edit" name="permissions[credit_notes][]" value="edit">
                  <label for="credit_notes_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="credit_notes_delete" name="permissions[credit_notes][]" value="delete">
                  <label for="credit_notes_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="customers">
            <td>
               <b>Customers</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" data-not-applicable="true" type="checkbox" class="capability" id="customers_view_own" name="permissions[customers][]" value="view_own" disabled="">
                  <label for="customers_view_own">
                  View (Own)                  </label>
                    <i class="fa fa-question-circle" data-toggle="tooltip" data-title="Based on customer admins" data-original-title="" title=""></i>               </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="customers_view" name="permissions[customers][]" value="view">
                  <label for="customers_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="customers_create" name="permissions[customers][]" value="create">
                  <label for="customers_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="customers_edit" name="permissions[customers][]" value="edit">
                  <label for="customers_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="customers_delete" name="permissions[customers][]" value="delete">
                  <label for="customers_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="email_templates">
            <td>
               <b>Email Templates</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="email_templates_view" name="permissions[email_templates][]" value="view">
                  <label for="email_templates_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="email_templates_edit" name="permissions[email_templates][]" value="edit">
                  <label for="email_templates_edit">
                  Edit                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="estimates">
            <td>
               <b>Estimates</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" type="checkbox" class="capability" id="estimates_view_own" name="permissions[estimates][]" value="view_own">
                  <label for="estimates_view_own">
                  View (Own)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="estimates_view" name="permissions[estimates][]" value="view">
                  <label for="estimates_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="estimates_create" name="permissions[estimates][]" value="create">
                  <label for="estimates_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="estimates_edit" name="permissions[estimates][]" value="edit">
                  <label for="estimates_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="estimates_delete" name="permissions[estimates][]" value="delete">
                  <label for="estimates_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="expenses">
            <td>
               <b>Expenses</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" type="checkbox" class="capability" id="expenses_view_own" name="permissions[expenses][]" value="view_own">
                  <label for="expenses_view_own">
                  View (Own)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="expenses_view" name="permissions[expenses][]" value="view">
                  <label for="expenses_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="expenses_create" name="permissions[expenses][]" value="create">
                  <label for="expenses_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="expenses_edit" name="permissions[expenses][]" value="edit">
                  <label for="expenses_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="expenses_delete" name="permissions[expenses][]" value="delete">
                  <label for="expenses_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="invoices">
            <td>
               <b>Invoices</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" type="checkbox" class="capability" id="invoices_view_own" name="permissions[invoices][]" value="view_own">
                  <label for="invoices_view_own">
                  View (Own)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="invoices_view" name="permissions[invoices][]" value="view">
                  <label for="invoices_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="invoices_create" name="permissions[invoices][]" value="create">
                  <label for="invoices_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="invoices_edit" name="permissions[invoices][]" value="edit">
                  <label for="invoices_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="invoices_delete" name="permissions[invoices][]" value="delete">
                  <label for="invoices_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="items">
            <td>
               <b>Items</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="items_view" name="permissions[items][]" value="view">
                  <label for="items_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="items_create" name="permissions[items][]" value="create">
                  <label for="items_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="items_edit" name="permissions[items][]" value="edit">
                  <label for="items_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="items_delete" name="permissions[items][]" value="delete">
                  <label for="items_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="knowledge_base">
            <td>
               <b>Knowledge Base</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="knowledge_base_view" name="permissions[knowledge_base][]" value="view">
                  <label for="knowledge_base_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="knowledge_base_create" name="permissions[knowledge_base][]" value="create">
                  <label for="knowledge_base_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="knowledge_base_edit" name="permissions[knowledge_base][]" value="edit">
                  <label for="knowledge_base_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="knowledge_base_delete" name="permissions[knowledge_base][]" value="delete">
                  <label for="knowledge_base_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="payments">
            <td>
               <b>Payments</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" data-not-applicable="true" type="checkbox" class="capability" id="payments_view_own" name="permissions[payments][]" value="view_own" disabled="">
                  <label for="payments_view_own">
                  View (Own)                  </label>
                    <i class="fa fa-question-circle" data-toggle="tooltip" data-title="Based on invoices VIEW (Own) permission" data-original-title="" title=""></i>               </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="payments_view" name="permissions[payments][]" value="view">
                  <label for="payments_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="payments_create" name="permissions[payments][]" value="create">
                  <label for="payments_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="payments_edit" name="permissions[payments][]" value="edit">
                  <label for="payments_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="payments_delete" name="permissions[payments][]" value="delete">
                  <label for="payments_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="projects">
            <td>
               <b>Projects</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" data-not-applicable="true" type="checkbox" class="capability" id="projects_view_own" name="permissions[projects][]" value="view_own" disabled="">
                  <label for="projects_view_own">
                  View (Own)                  </label>
                    <i class="fa fa-question-circle" data-toggle="tooltip" data-title="If staff member do not have permission VIEW (Global) will be shown only projects where staff member is added as project member."></i>               </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="projects_view" name="permissions[projects][]" value="view">
                  <label for="projects_view">
                  View(Global)                  </label>
                    <i class="fa fa-question-circle" data-toggle="tooltip" data-title="VIEW allows staff member to see ALL projects. If you only want them to see projects they are assigned (added as members), do not give VIEW permissions." data-original-title="" title=""></i>               </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="projects_create" name="permissions[projects][]" value="create">
                  <label for="projects_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="projects_edit" name="permissions[projects][]" value="edit">
                  <label for="projects_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="projects_delete" name="permissions[projects][]" value="delete">
                  <label for="projects_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="proposals">
            <td>
               <b>Proposals</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" type="checkbox" class="capability" id="proposals_view_own" name="permissions[proposals][]" value="view_own">
                  <label for="proposals_view_own">
                  View (Own)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="proposals_view" name="permissions[proposals][]" value="view">
                  <label for="proposals_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="proposals_create" name="permissions[proposals][]" value="create">
                  <label for="proposals_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="proposals_edit" name="permissions[proposals][]" value="edit">
                  <label for="proposals_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="proposals_delete" name="permissions[proposals][]" value="delete">
                  <label for="proposals_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="reports">
            <td>
               <b>Reports</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="reports_view" name="permissions[reports][]" value="view">
                  <label for="reports_view">
                  View(Global)                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="roles">
            <td>
               <b>Staff Roles</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="roles_view" name="permissions[roles][]" value="view">
                  <label for="roles_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="roles_create" name="permissions[roles][]" value="create">
                  <label for="roles_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="roles_edit" name="permissions[roles][]" value="edit">
                  <label for="roles_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="roles_delete" name="permissions[roles][]" value="delete">
                  <label for="roles_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="settings">
            <td>
               <b>Settings</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="settings_view" name="permissions[settings][]" value="view">
                  <label for="settings_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="settings_edit" name="permissions[settings][]" value="edit">
                  <label for="settings_edit">
                  Edit                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="staff">
            <td>
               <b>Staff</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="staff_view" name="permissions[staff][]" value="view">
                  <label for="staff_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="staff_create" name="permissions[staff][]" value="create">
                  <label for="staff_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="staff_edit" name="permissions[staff][]" value="edit">
                  <label for="staff_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="staff_delete" name="permissions[staff][]" value="delete">
                  <label for="staff_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="subscriptions">
            <td>
               <b>Subscriptions</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" type="checkbox" class="capability" id="subscriptions_view_own" name="permissions[subscriptions][]" value="view_own">
                  <label for="subscriptions_view_own">
                  View (Own)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="subscriptions_view" name="permissions[subscriptions][]" value="view">
                  <label for="subscriptions_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="subscriptions_create" name="permissions[subscriptions][]" value="create">
                  <label for="subscriptions_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="subscriptions_edit" name="permissions[subscriptions][]" value="edit">
                  <label for="subscriptions_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="subscriptions_delete" name="permissions[subscriptions][]" value="delete">
                  <label for="subscriptions_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="tasks">
            <td>
               <b>Tasks</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view-own="" data-not-applicable="true" type="checkbox" class="capability" id="tasks_view_own" name="permissions[tasks][]" value="view_own" disabled="">
                  <label for="tasks_view_own">
                  View (Own)                  </label>
                    <i class="fa fa-question-circle" data-toggle="tooltip" data-title="If staff member do not have permission VIEW (Global) will be shown only tasks where staff member is follower,assigned, task is public or in Setup->Settings->Tasks-> Allow all staff to see all tasks related to projects is set to YES when task is linked to project."></i>               </div>
                              <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="tasks_view" name="permissions[tasks][]" value="view">
                  <label for="tasks_view">
                  View(Global)                  </label>
                    <i class="fa fa-question-circle" data-toggle="tooltip" data-title="VIEW allows staff member to see ALL tasks. If you only want them to see tasks they are assigned to or following, do not give VIEW permissions."></i>               </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="tasks_create" name="permissions[tasks][]" value="create">
                  <label for="tasks_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="tasks_edit" name="permissions[tasks][]" value="edit">
                  <label for="tasks_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="tasks_delete" name="permissions[tasks][]" value="delete">
                  <label for="tasks_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="checklist_templates">
            <td>
               <b>Task Checklist Templates</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input type="checkbox" class="capability" id="checklist_templates_create" name="permissions[checklist_templates][]" value="create">
                  <label for="checklist_templates_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="checklist_templates_delete" name="permissions[checklist_templates][]" value="delete">
                  <label for="checklist_templates_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="leads">
            <td>
               <b>Leads</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="leads_view" name="permissions[leads][]" value="view">
                  <label for="leads_view">
                  View(Global)                  </label>
                    <i class="fa fa-question-circle" data-toggle="tooltip" data-title="If this permission is not checked, a staff member will be only able to view leads to where is assigned, leads created by the staff member and leads that are marked as public"></i>               </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="leads_delete" name="permissions[leads][]" value="delete">
                  <label for="leads_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="goals">
            <td>
               <b>Goals</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="goals_view" name="permissions[goals][]" value="view">
                  <label for="goals_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="goals_create" name="permissions[goals][]" value="create">
                  <label for="goals_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="goals_edit" name="permissions[goals][]" value="edit">
                  <label for="goals_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="goals_delete" name="permissions[goals][]" value="delete">
                  <label for="goals_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
                  <tr data-name="surveys">
            <td>
               <b>Surveys</b>
            </td>
            <td>
                                             <div class="checkbox">
                  <input data-can-view="" type="checkbox" class="capability" id="surveys_view" name="permissions[surveys][]" value="view">
                  <label for="surveys_view">
                  View(Global)                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="surveys_create" name="permissions[surveys][]" value="create">
                  <label for="surveys_create">
                  Create                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="surveys_edit" name="permissions[surveys][]" value="edit">
                  <label for="surveys_edit">
                  Edit                  </label>
                                   </div>
                              <div class="checkbox">
                  <input type="checkbox" class="capability" id="surveys_delete" name="permissions[surveys][]" value="delete">
                  <label for="surveys_delete">
                  Delete                  </label>
                                   </div>
                                          </td>
         </tr>
               </tbody>
   </table>
</div>
               <hr>
                  <button type="submit" class="btn btn-info pull-right">Save</button>
                  </form>
</body>
</html>