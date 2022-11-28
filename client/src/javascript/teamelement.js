
const TeamElement = class {

    showTeamBio(elem) {
        let bioImg = elem.querySelector(':scope .team-member-image');
        if (bioImg !== null) {
            this.teamModalImgHolder.innerHTML = bioImg.innerHTML;
        }

        let bioContent = elem.querySelector(':scope .team-member-content');
        this.teamModalContentHolder.innerHTML = bioContent.innerHTML;
        this.teamModalContentHolder.querySelector(':scope .team-member-bio').classList.remove('visually-hidden');
        this.teamModalContentHolder.querySelector(':scope .read-more').classList.add('visually-hidden');

        this.teamModal.showModal();
    }

    initDialogActions() {
        document.querySelectorAll('.bbp-team-element .team-member.has-bio').forEach((teamElem) => {
            teamElem.addEventListener('click', () => {
                this.showTeamBio(teamElem);
            });
        });
    }

    initModalClosers() {
        document.querySelectorAll('.bbp-team-element .team-modal-closer').forEach((closerElem) => {
            closerElem.addEventListener('click', () => {
                this.teamModal.close();
                this.teamModalImgHolder.innerHTML = '';
                this.teamModalContentHolder.innerHTML = '';
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
