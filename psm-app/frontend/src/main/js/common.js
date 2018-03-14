$(document).ready(function () {

  $('.searchPanel input[type="checkbox"]')
    .css("border", "none")
    .css("background", "none")
    .css("position", "relative")
    .css('top', "-1px");

  addressPositionModal = function () {
    var wWidth  = window.innerWidth;
    var wHeight = window.innerHeight;

    if (wWidth == undefined) {
      wWidth  = document.documentElement.clientWidth;
      wHeight = document.documentElement.clientHeight;
    }

    boxLeft = parseInt((wWidth / 2) - ($("#new-modal").width() / 2));
    //var boxTop  = parseInt((wHeight / 2) - ( $("#new-modal").height() / 2 ));

    // position modal
    $("#new-modal").css({
      'margin': 120 + 'px auto 0 ' + boxLeft + 'px'
    });

    $("#modalBackground").css("opacity", "0.8");

    if ($("body").height() > $("#modalBackground").height()) {
      $("#modalBackground").css("height", $("body").height() + "px");
    }

    if ($('#new-modal').height() > $("#modalBackground").height()) {
      $("#modalBackground").css("height", $('#new-modal').height() + 120 + "px");
    }

    $(window).scrollTop(0);
  };

  addressLoadModal = function (itemId) {
    $('#modalBackground').show();
    $(itemId).show();
    addressPositionModal();
  }

  addressCloseModal = function () {
    $('#modalBackground').hide();
    $('#new-modal>div').hide();
  }

  /**
  * Clears and resets the contents of the user help modal
  * (before it gets populated with results of AJAX call).
  */
  resetUserHelpModal = function (modalSelector) {
    var modal = document.querySelector(modalSelector);
    var modalTitle = modal.querySelector('.userHelpModalTitle');
    var modalBody = modal.querySelector('.userHelpModalBody');
    modalTitle.innerHTML = '';
    modalBody.innerHTML = 'Loading...';
  }

  /**
  * Populates a user help modal with content.  With the first three
  * arguments bound (using '.bind'), this is used as the callback
  * function for AJAX calls that fetch a user help page.  It extracts
  * the relevant content from the help page and adds it to the modal.
  *
  * @param modalId {string} - ID of the target modal.
  * @param helpItemIds {array of strings} - IDs of the source help items.
  * @param title {string or undefined} - modal title to use with multiple help items.
  * @param helpPageString {string} - HTML of the help page.
  */
  populateUserHelpModal = function (modalId, helpItemIds, title, helpPageString) {
    var parser = new DOMParser();
    var helpPage = parser.parseFromString(helpPageString, "text/html");

    var modal = document.getElementById(modalId);
    var modalTitle = modal.querySelector(".userHelpModalTitle");
    var modalBody = modal.querySelector(".userHelpModalBody");

    if (title) {
      modalTitle.innerHTML = title;
      // Remove "Loading..." or other text from modal body.
      modalBody.innerHTML = "";

      helpItemIds.forEach(function (helpItemId) {
        var helpItem = helpPage.getElementById(helpItemId);

        // Remove the permalink anchor tag from the help title.
        var helpTitle = helpItem.querySelector("h2");
        helpTitle.innerHTML = helpTitle.firstChild.textContent;

        while (helpItem.firstChild) {
          modalBody.appendChild(helpItem.firstChild);
        }
      });

    } else {
      var helpItem = helpPage.getElementById(helpItemIds[0]);
      var helpTitle = helpItem.querySelector("h2");

      modalTitle.innerHTML = helpTitle.firstChild.textContent;

      helpItem.removeChild(helpTitle);
      modalBody.innerHTML = helpItem.innerHTML;
    }
  };

  /**
  * Add a click handler function to a user help modal link.
  * Title is optional; is absent (undefined) to show a single help item.
  *
  * @param helpLinkSelector {string} - Selector for the help link.
  * @param helpDocsPath {string} - Path to the help doc html file.
  * @param helpItemIds {array of strings} - IDs of the source help items.
  * @param title {string or undefined} - Title to use with multiple help items.
  */
  addUserHelpClickHandler = function (helpLinkSelector, helpDocsPath, helpItemIds, title) {
    $(helpLinkSelector).click(function () {
      resetUserHelpModal('#user-help-modal');
      addressLoadModal('#user-help-modal');
      $.get(
        ctx + helpDocsPath,
        populateUserHelpModal.bind(
          undefined,
          'user-help-modal',
          helpItemIds,
          title
        )
      );
    });
  };

  $(".closeModal, .modalCloseButton, #new-modal #printModal .modal-title a.greyBtn")
    .click(addressCloseModal);

  $(".submitEnrollmentModalBtn").click(function () {
    addressCloseModal();
    addressLoadModal('#submitEnrollmentModal');
  });

  $(".saveAsDraftModalBtn").click(function () {
    addressCloseModal();
    addressLoadModal('#saveAsDraftModal');
  });

});
