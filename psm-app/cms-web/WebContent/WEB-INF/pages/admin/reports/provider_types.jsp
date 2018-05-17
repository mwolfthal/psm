<%@ include file="/WEB-INF/pages/admin/includes/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en-US">
  <c:set var="title" value="Provider Types"/>
  <c:set var="adminPage" value="true" />
  <c:set var="includeD3" value="true" />
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
            <span>Provider Types</span>
          </div>
          <div class="head">
            <h1 class="text">Provider Types</h1>
            <a
              class="downloadProviderTypesLink"
              href="${ctx}/admin/reports/providertypes.csv?${providerTypeCodesQueryString}"
              >Download this report</a>
          </div>
          <div class="tabSection">
            <div class="detailPanel">
              <form action="${ctx}/admin/reports/provider-types" :method "get">
                <select name="providerType" multiple="multiple">
                  <c:forEach var="providerType" items="${providerTypes}">
                    <option
                      value="${providerType.code}"
                      <c:if test="${enteredProviderTypeCodes.contains(providerType.code)}">
                        selected="selected"
                      </c:if>
                    >${providerType.description}</option>
                  </c:forEach>
                </select>
                <div class="row">
                  <input
                    type="submit"
                    value="Filter"
                    class="purpleBtn viewProviderTypesButton"
                  />
                </div>
              </form>
            </div>
          </div>
          <div class="reportTable dashboardPanel">
            <c:forEach var="month" items="${months}">
              <div class="tableData">
                <div class="tableTitle">
                  <h2>${month.month}</h2>
                </div>
                <table class="generalTable">
                  <thead>
                    <tr>
                      <th>Provider Type</th>
                      <th class="providerTypesNum">Number Reviewed</th>
                    </tr>
                  </thead>
                  <c:forEach var="providerType" items="${month.providerTypes}">
                    <tr>
                      <td>${providerType.description}</td>
                      <td>${month.getEnrollments(providerType).size()}</td>
                    </tr>
                  </c:forEach>
                </table>
              </div>
            </c:forEach>
          </div>

        </div>
      </div>
      <!-- /#mainContent -->

      <h:handlebars template="includes/footer" context="${pageContext}"/>
    </div>
    <!-- /#wrapper -->
  </body>
</html>
