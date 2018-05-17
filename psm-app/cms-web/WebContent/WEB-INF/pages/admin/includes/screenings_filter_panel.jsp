<%--
  The filter panel for: admin user login > Screenings > Draft (Pending, Approved, Denied, etc.) pages.
--%>
<%@ include file="/WEB-INF/pages/admin/includes/taglibs.jsp"%>
<div id="enrollmentFilterPanel" <c:choose><c:when test="${searchCriteria.showFilterPanel}">style="display: block"</c:when><c:otherwise>style="display: none"</c:otherwise></c:choose> class="filterPanel">
    <div class="floatW">
        <div class="leftCol">
            <div class="row">
                <input id="" type="checkbox" class="" value="" />
                <label style="width:90%">Show only most recent screenings.</label>
            </div>

            <%--
            <div class="row">
                <label for="enrollmentSearchFilterNpiInput">NPI/UMPI</label>
                <input id="enrollmentSearchFilterNpiInput" type="text" class="normalInput" value="${searchCriteria.npi}"/>
            </div>
            <div class="row">
                <label for="enrollmentSearchFilterProviderTypeInput">Provider Type</label>
                <select id="enrollmentSearchFilterProviderTypeInput" class="longSelect">
                    <option value="">All</option>
                    <c:forEach var="item" items="${providerTypesLookup}">
                        <option <c:if test="${item.description == searchCriteria.providerType}">selected="selected"</c:if> value="${item.description}">${item.description}</option>
                    </c:forEach>
                </select>
            </div>
            --%>

        </div>
        <div class="rightCol">
            <div class="row">
                <input id="" type="checkbox" class="" value="" />
                <label style="width:90%">Show only re-screenings.</label>
            </div>

            <%--
            <div class="row">
                <label for="enrollmentSearchFilterProviderNameInput">Provider Name</label>
                <input id="enrollmentSearchFilterProviderNameInput" value="${searchCriteria.providerName}" type="text" class="normalInput"/>
            </div>
            <div class="row">
                <label for="enrollmentSearchFilterRequestTypeInput">Request Type</label>
            </div>
            <div class="row">
                <label for="enrollmentSearchFilterRiskLevelInput">Risk Level</label>
            </div>
            --%>

        </div>
    </div>
    <a id="showSearchEnrollmentsResultBtn" href="javascript:;" class="purpleBtn showResultBtn">Filter</a>
</div>
<div class="clearFixed"></div>
<div class="tabCorner hide">
    <div class="tabCornerR">
        <div class="tabCornerM"></div>
    </div>
</div>
<!-- /.filterPanel -->
