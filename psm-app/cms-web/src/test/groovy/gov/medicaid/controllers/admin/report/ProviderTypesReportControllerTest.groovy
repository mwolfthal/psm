package gov.medicaid.controllers.admin.report

import gov.medicaid.entities.SearchResult
import gov.medicaid.services.ProviderEnrollmentService
import gov.medicaid.entities.Enrollment
import gov.medicaid.entities.EnrollmentStatus
import gov.medicaid.entities.dto.ViewStatics

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import javax.servlet.http.HttpServletResponse

import org.springframework.web.servlet.ModelAndView
import org.springframework.mock.web.MockHttpServletResponse
import org.apache.commons.csv.CSVFormat
import org.apache.commons.csv.CSVParser

import spock.lang.Specification

class ProviderTypesReportControllerTest extends Specification {
    private ProviderTypesReportController controller
    private ProviderEnrollmentService service

    void setup() {
        controller = new TimeToReviewReportController();
        service = Mock(ProviderEnrollmentService);

        controller.setEnrollmentService(service);
    }
}
