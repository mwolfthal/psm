 <%--
  - Author: TCSASSEMBLER
  - Version: 1.0
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the admin screening schedules edit page.
--%>
<%@ include file="/WEB-INF/pages/admin/includes/taglibs.jsp" %>

<!DOCTYPE html>
<html lang="en-US">
  <c:set var="title" value="Edit Screening Schedule - Functions (Service Admin)"/>
  <c:set var="adminPage" value="true" />
  <h:handlebars template="includes/html_head" context="${pageContext}" />
  <body>
    <div id="wrapper">
      <h:handlebars template="includes/header" context="${pageContext}"/>
      <div id="mainContent">
        <div class="contentWidth">
          <div class="mainNav">
            <h:handlebars template="includes/logo" context="${pageContext}"/>
            <c:set var="activeTabFunctions" value="true"></c:set>
            <h:handlebars template="includes/nav" context="${pageContext}"/>
          </div>
          <div class="breadCrumb">
            Functions
          </div>
          <h1>Functions</h1>
          <div class="tabSection functionTab" id="enrollmentSection">
            <c:set var="functionsServiceActiveMenuScreeningSchedules" value="1"/>
            <h:handlebars template="admin/includes/functions_service_nav" context="${pageContext}" />
            <div class="tabContent" id="tabScreeningSchedules">
              <form:form id="updateScreeningScheduleForm" modelAttribute="schedule" action="${ctx}/admin/updateScreeningSchedule" method="post">
                <div id="changeScreenSchedulePanel">
                  <div class="newEnrollmentPanel">
                    <div class="section">
                      <div class="wholeCol">
                        <div class="row">
                          <p class="borderBottom">The system will use the following schedule to automatically screen all pending enrollments that have not been manually scheduled for screening.</p>
                        </div>
                        <div class="row">
                          <form:label path="dayOfMonth">
                            Day of month to automatically rescreen
                          </form:label>
                          <span class="floatL"><b>:</b></span>
                          <form:select path="dayOfMonth">
                            <c:forEach begin="1" end="28" varStatus="loop">
                              <form:option value="${loop.index}">
                                ${loop.index}
                              </form:option>
                            </c:forEach>
                          </form:select>
                        </div>
                        <div class="row">
                          <form:label path="hourOfDay">
                            Hour of day to automatically rescreen
                          </form:label>
                          <span class="floatL"><b>:</b></span>
                          <form:select path="hourOfDay">
                            <c:forEach begin="0" end="23" varStatus="loop">
                              <form:option value="${loop.index}">
                                ${loop.index}:00
                              </form:option>
                            </c:forEach>
                          </form:select>
                        </div>
                      </div>
                    </div>
                    <div class="bl"></div>
                    <div class="br"></div>
                  </div>
                  <div class="buttons">
                    <a href="${ctx}/admin/getScreeningSchedule" class="greyBtn">Cancel</a>
                    <form:button class="greyBtn">Save</form:button>
                  </div>
                </div>
              </form:form>
              <!-- /#changeScreenSchedulePanel -->
            </div>
            <!-- /#tabScreeningSchedules -->
          </div>
        </div>
      </div>
      <!-- /#mainContent -->

      <h:handlebars template="includes/footer" context="${pageContext}"/>
    </div>
    <!-- /#wrapper -->
  </body>
</html>
