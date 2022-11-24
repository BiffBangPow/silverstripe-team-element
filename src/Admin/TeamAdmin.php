<?php

namespace BiffBangPow\Element\Admin;

use BiffBangPow\Extension\SortableAdminExtension;
use BiffBangPow\Element\Model\TeamMember;
use SilverStripe\Admin\ModelAdmin;

class TeamAdmin extends ModelAdmin
{
    private static $extensions = [
        SortableAdminExtension::class
    ];
    private static $managed_models = [
        TeamMember::class
    ];
    private static $menu_title = 'Team Members Admin';
    private static $menu_icon_class = 'font-icon-torso';
    private static $url_segment = 'team';
}
