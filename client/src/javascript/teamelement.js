
const TeamElement = class {

    showTeamBio(elem) {
        let bioImg = elem.querySelector(':scope .team-member-image');
        if (bioImg !== null) {
            this.teamModalImgHolder.innerHTML = bioImg.innerHTML;
        }
        this.teamModal.showModal();
    }

    initDialogActions() {
        document.querySelectorAll('.team-element .team-member.has-bio').forEach((teamElem) => {
            teamElem.addEventListener('click', () => {
                this.showTeamBio(teamElem);
            });
        });
    }

    initModalClosers() {
        document.querySelectorAll('.team-element .team-modal-closer').forEach((closerElem) => {
            closerElem.addEventListener('click', () => {
                this.teamModal.close();
                this.teamModalImgHolder.innerHTML = '';
            });
        });
    }

    constructor() {
        this.teamModal = document.getElementById('team-popup');
        this.teamModalImgHolder = document.getElementById('team-popup-image');
        this.teamModalContentHolder = document.getElementById('team-popup-content');
        this.initDialogActions();
        this.initModalClosers();
    }
}


document.addEventListener("DOMContentLoaded", () => {
    let elemAction = new TeamElement();
});
