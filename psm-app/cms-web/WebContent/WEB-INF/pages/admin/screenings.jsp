<%@ include file="/WEB-INF/pages/admin/includes/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en-US">
  <c:set var="title" value="Screenings"/>
  <c:set var="adminPage" value="true" />
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
            Screenings
          </div>
          <div class="head">
            <h1 class="text">Screenings</h1>
          </div>
          <div class="clearFixed"></div>

            <div class="detailPanel screeningsDateRange">
              <form action="${ctx}/admin/reports/applications-by-reviewer" :method "get">
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
                    />
                  </span>
                  <input
                    type="submit"
                    value="Update Dates"
                    class="purpleBtn viewApplicationsByReviewerButton"
                    style="margin-top: 4px; margin-left: 10px;"
                  />
                </div>
              </form>
            </div>


          <div class="tabSection" id="enrollmentSection">
            <c:set var="active_screenings_tab" value="all"/>
            <%--
              TODO:
              <c:set var="enrollmentSearchFormAction" value="${ctx}/provider/search/draft?statuses=Draft"/>
              <c:set var="searchResult" value="${results}"/>
              <c:set var="itemsName" value="Enrollment Draft${searchResult.total>1?'s':''}"/>
            --%>
            <%@ include file="/WEB-INF/pages/admin/includes/screenings_tab_section.jsp" %>
            <%--
              TODO:
              for search, export, print
              (errors currently)
              org.springframework.web.util.NestedServletException:
              Request processing failed;
              nested exception is java.lang.RuntimeException:
              java.lang.IllegalStateException:
              Neither BindingResult nor plain target object for
              bean name 'searchCriteria' available as request attribute

              <%@ include file="/WEB-INF/pages/admin/includes/enrollment_search_form.jsp" %>
              --%>
            <!-- /.tabHead -->
            <div class="tabContent">
              <div class="pagination">
                <%--
                  TODO: Top pagination nav, and buttons for filter, pdf, print.
                --%>
                  <%@ include file="/WEB-INF/pages/admin/includes/page_left_navigation.jsp" %>
                  <%@ include file="/WEB-INF/pages/admin/includes/enrollment_buttons.jsp" %>
              </div>
              <%--
                TODO: Filter panel.
              --%>
                <%@ include file="/WEB-INF/pages/admin/includes/screenings_filter_panel.jsp" %>
              <c:choose>
              <c:when test="${1 == 0}">
                <div class="tableWrapper">
                  <div class="tableContainer"></div>
                  <div class="tabFoot">
                    <div class="tabR">
                      <div class="tabM red">
                        No matched data found.
                      </div>
                    </div>
                  </div>
                </div>
              </c:when>
              <c:otherwise>
                <div class="tableWrapper">
                  <div class="tableContainer">
                    <%@ include file="/WEB-INF/pages/admin/includes/screenings_table.jsp" %>
                  </div>
                  <!-- /.tableContainer -->
                  <div class="tabFoot">
                    <div class="tabR">
                      <div class="tabM">
                        <%--
                          TODO: Bottom pagination.
                        --%>
                          <%@ include file="/WEB-INF/pages/admin/includes/page_navigation.jsp" %>
                      </div>
                    </div>
                  </div>
                  <!-- /.tabFoot -->
                </div>
              </c:otherwise>
              </c:choose>
            </div>
          </div>
          <!-- /.tabSection -->

        </div>
      </div>
      <!-- /#mainContent -->

      <h:handlebars template="includes/footer" context="${pageContext}"/>
    </div>
    <!-- /#wrapper -->
  </body>
</html>