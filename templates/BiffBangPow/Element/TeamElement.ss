<div class="container lazyload-transition">
    <% if $Title && $ShowTitle %>
        <div class="headline-container">
            <h2>$FormattedTitle</h2>
        </div>
    <% end_if %>

    <div class="team-container">

        <% loop $TeamMembers %>
            <div class="team-member">
                <div class="accent"></div>

                <% if $Image %>
                    <div class="team-member-image-container">
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
                    <div class="team-member-content-container">
                        <h3>$Name</h3>
                        <p>$JobTitle</p>
                        <div class="team-links">
                            <div>
                                <a class="team-contact-link" href="$LinkedIn" target="_blank" rel="noopener">
                                    <img class="social-icon icon-linkedin team-icon"
                                         src="$ThemeDir/client/dist/img/social/linkedin-in.svg" alt="LinkedIn page">
                                </a>
                                <a class="team-contact-link" href="mailto:$Email">
                                    <img class="social-icon icon-email team-icon"
                                         src="$ThemeDir/client/dist/img/envelope.svg"
                                         alt="Direct email">
                                </a>
                            </div>
                            <p class="read-more" data-micromodal-trigger="modal-$ID">Read bio</p>
                        </div>
                    </div>
                    <div class="team-member-gradient-overlay"></div>
                </div>
                <div class="accent"></div>
            </div>

            <% include TeamMember_Modal %>
        <% end_loop %>

    </div>
</div>


<% require javascript('biffbangpow/silverstripe-team-element:client/dist/javascript/teamelement.js') %>

