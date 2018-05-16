<%@ include file="/WEB-INF/pages/admin/includes/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en-US">
  <c:set var="title" value="Applications by Reviewer"/>
  <c:set var="adminPage" value="true" />
  <c:set var="includeD3" value="true" />
  <fmt:formatDate value="${startDate}" pattern="MM/dd/yyyy" var="searchStartDate" />
  <fmt:formatDate value="${endDate}" pattern="MM/dd/yyyy" var="searchEndDate" />
  <h:handlebars template="includes/html_head" context="${pageContext}" />
  <body>
    <div id="wrapper">
      <h:handlebars template="includes/header" context="${pageContext}"/>
      <div id="mainContent">
        <div class="contentWidth">
          <div class="mainNav">
            <h:handlebars template="includes/logo" context="${pageContext}"/>
            <h:handlebars template="includes/nav" context="${pageContext}"/>
          </div>
          <div class="breadCrumb">
            <a href="<c:url value='/admin/reports' />">Reports</a>
            <span>Applications by Reviewer</span>
          </div>
          <div class="head">
            <h1 class="text">Applications by Reviewer</h1>
            <c:if test="${submitted}">
              <a
                class="downloadApplicationsByReviewerLink"
                href="${ctx}/admin/reports/applicationreviewers.csv?startDate=${searchStartDate}&endDate=${searchEndDate}"
                >Download this report</a>
            </c:if>
          </div>
          <div class="tabSection">
            <div class="detailPanel">
              <form action="${ctx}/admin/reports/applications-by-reviewer" :method "get">
                <div class="row">
                  Enter a date range or leave both dates blank to include all
                  historical data.
                </div>
                <div class="row rowDateRange">
                  <span class="dateWrapper floatL">
                    <input
                      name="startDate"
                      id="startDate"
                      class="date hasDatePicker inputBox"
                      title="Date Start"
                      placeholder="Start Date"
                      class="date"
                      type="text"
                      value="${searchStartDate}"
                      readonly="readonly"
                    />
                  </span>
                  <span class="floatL">-</span>
                  <span class="dateWrapper floatL">
                    <input
                      name="endDate"
                      id="endDate"
                      class="date hasDatePicker inputBox"
                      title="Date End"
                      placeholder="End Date"
                      class="date"
                      type="text"
                      value="${searchEndDate}"
                      readonly="readonly"
                    />
                  </span>
                </div>
                <div class="row">
                  <input
                    type="submit"
                    value="View Report"
                    class="purpleBtn viewApplicationsByReviewerButton"
                  />
                </div>
              </form>
            </div>
          </div>
          <c:choose>
            <c:when test="${! submitted}">
            </c:when>
            <c:when test="${fn:length(enrollments) gt 0}">
              <div class="reportTable tableData dashboardPanel">
                <div class="tableData">
                  <table class="generalTable">
                    <thead>
                      <tr>
                        <th>Application ID</th>
                        <th>Submission Date</th>
                        <th>Reviewed By</th>
                        <th>Review Date</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <c:forEach var="enrollment" items="${enrollments}">
                      <tr class="reportRow">
                        <td>${enrollment.ticketId}</td>
                        <td><fmt:formatDate value="${enrollment.createdOn}" pattern="dd MMMM yyyy" /></td>
                        <td>${enrollment.lastUpdatedBy.username}</td>
                        <td><fmt:formatDate value="${enrollment.statusDate}" pattern="dd MMMM yyyy" /></td>
                        <td>${enrollment.status.description}</td>
                      </tr>
                    </c:forEach>
                  </table>
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="tabSection">
                <div class="detailPanel">
                  <h2 class="noResults">No results found</h2>
                </div>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
      <!-- /#mainContent -->

      <h:handlebars template="includes/footer" context="${pageContext}"/>
    </div>
    <!-- /#wrapper -->
  </body>
</html>
