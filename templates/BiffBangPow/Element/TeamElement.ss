<div class="container">
    <% if $Title && $ShowTitle %>
        <div class="row">
            <div class="col-12">
                <h2 class="element-title">$Title</h2>
            </div>
        </div>
    <% end_if %>

    <% if $Content %>
        <div class="row my-4">
            <div class="col-12">
                $Content
            </div>
        </div>
    <% end_if %>

    <div class="row row-cols-$ColsMobile row-cols-md-$ColsTablet row-cols-lg-$ColsDesktop row-cols-xl-$ColsLarge">

        <% loop $TeamMembers %>
            <div class="col team-member<% if $Bio %> has-bio<% end_if %> mb-4">

                <% if $Image %>
                    <div class="team-member-image mb-4">
                        <picture>
                            <% with $Image.Fill(511,653) %>
                                <source type="image/webp" srcset="$Format('webp').URL">
                                <img alt="$Up.Up.Title" class="lazyload img-fluid" data-src="$URL" src="" loading="lazy"
                                     width="$Width" height="$Height">
                            <% end_with %>
                        </picture>
                    </div>
                <% end_if %>

                <div class="team-member-content">

                    <div class="team-links mb-4">
                        <% if $LinkedIn %>
                            <a class="team-contact-link me-1 team-icon d-inline-flex justify-content-center align-items-center" href="$LinkedIn" target="_blank" rel="noopener">
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
                                    <style>svg {
                                        fill: #000000
                                    }</style>
                                    <path
                                        d="M100.28 448H7.4V148.9h92.88zM53.79 108.1C24.09 108.1 0 83.5 0 53.8a53.79 53.79 0 0 1 107.58 0c0 29.7-24.1 54.3-53.79 54.3zM447.9 448h-92.68V302.4c0-34.7-.7-79.2-48.29-79.2-48.29 0-55.69 37.7-55.69 76.7V448h-92.78V148.9h89.08v40.8h1.3c12.4-23.5 42.69-48.3 87.88-48.3 94 0 111.28 61.9 111.28 142.3V448z"></path>
                                </svg>
                            </a>
                        <% end_if %>
                        <% if $Email %>
                            <a class="team-contact-link me-1 team-icon d-inline-flex justify-content-center align-items-center" href="mailto:$Email">
                                <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
                                    <style>svg {
                                        fill: #000000
                                    }</style>
                                    <path
                                        d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/>
                                </svg>
                            </a>
                        <% end_if %>
                        <% if $TeamMemberPhone %>
                            <span class="team-phone">
                                <span class="team-icon d-inline-flex justify-content-center align-items-center me-1">
                         <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg {
                             fill: #000000
                         }</style><path
                             d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"/></svg>
                                </span>$TeamMemberPhone
                            </span>
                        <% end_if %>
                    </div>

                    <p class="team-member-name">$Name</p>
                    <p class="team-member-title">$JobTitle</p>
                    <% if $Summary %>
                        <div class="team-member-summary my-4">
                            $Summary
                        </div>
                    <% end_if %>
                    <% if $Bio %>
                        <div class="team-member-bio visually-hidden">$Bio</div>
                    <% end_if %>
                    <% if $Bio %>
                        <button class="read-more mt-3 btn btn-outline-primary"><%t Team.ReadMore 'Read more' %></button>
                    <% end_if %>
                </div>
            </div>

        <% end_loop %>
    </div>

</div>

<dialog id="team-popup" class="pt-1">
    <div class="d-flex justify-content-end">
        <button class="btn w-auto p-0 team-modal-closer">
            <img class="modal-closer"
                 src="$resourceURL('biffbangpow/silverstripe-team-element:client/dist/img/times-circle.svg')"
                 alt="Close window" height="25">
        </button>
    </div>
    <div class="row">
        <div class="col-12 col-md-6" id="team-popup-image">
            //Image
        </div>
        <div class="col-12 col-md-6" id="team-popup-content">
            //Content
        </div>
    </div>
</dialog>

