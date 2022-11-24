"use strict";

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }
function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }
var TeamElement = /*#__PURE__*/function () {
  function TeamElement() {
    _classCallCheck(this, TeamElement);
    this.teamModal = document.getElementById('team-popup');
    this.teamModalImgHolder = document.getElementById('team-popup-image');
    this.teamModalContentHolder = document.getElementById('team-popup-content');
    this.initDialogActions();
    this.initModalClosers();
  }
  _createClass(TeamElement, [{
    key: "showTeamBio",
    value: function showTeamBio(elem) {
      var bioImg = elem.querySelector(':scope .team-member-image');
      if (bioImg !== null) {
        this.teamModalImgHolder.innerHTML = bioImg.innerHTML;
      }
      this.teamModal.showModal();
    }
  }, {
    key: "initDialogActions",
    value: function initDialogActions() {
      var _this = this;
      document.querySelectorAll('.team-element .team-member.has-bio').forEach(function (teamElem) {
        teamElem.addEventListener('click', function () {
          _this.showTeamBio(teamElem);
        });
      });
    }
  }, {
    key: "initModalClosers",
    value: function initModalClosers() {
      var _this2 = this;
      document.querySelectorAll('.team-element .team-modal-closer').forEach(function (closerElem) {
        closerElem.addEventListener('click', function () {
          _this2.teamModal.close();
          _this2.teamModalImgHolder.innerHTML = '';
        });
      });
    }
  }]);
  return TeamElement;
}();
document.addEventListener("DOMContentLoaded", function () {
  var elemAction = new TeamElement();
});
//# sourceMappingURL=../../dist/javascript/maps/teamelement.js.map
