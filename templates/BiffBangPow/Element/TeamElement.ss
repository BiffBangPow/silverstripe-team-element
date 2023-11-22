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
                            <a class="team-contact-link me-2" href="$LinkedIn" target="_blank" rel="noopener">
                                <img class="icon-linkedin team-icon"
                                     src="$resourceURL('biffbangpow/silverstripe-team-element:client/dist/img/linkedin-in.svg')"
                                     alt="LinkedIn page" height="20">
                            </a>
                        <% end_if %>
                        <% if $Email %>
                            <a class="team-contact-link me-2" href="mailto:$Email">
                                <img class="icon-email team-icon"
                                     src="$resourceURL('biffbangpow/silverstripe-team-element:client/dist/img/envelope.svg')"
                                     alt="Direct email" height="20">
                            </a>
                        <% end_if %>
                        <% if $TeamMemberPhone %>
                            <span class="team-phone">
                                <img class="icon-phone team-icon"
                                     src="$resourceURL('biffbangpow/silverstripe-team-element:client/dist/img/phone.svg')"
                                     alt="Direct phone" height="18">
                                $TeamMemberPhone
                            </span>
                        <% end_if %>
                    </div>

                    <p class="team-member-name">$Name</p>
                    <p class="team-member-title">$JobTitle</p>
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
    <div class="row d-flex justify-content-end">
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

