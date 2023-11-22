<?php

namespace BiffBangPow\Element;

use BiffBangPow\Element\Control\TeamElementController;
use BiffBangPow\Element\Model\TeamMember;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\HeaderField;

class TeamElement extends BaseElement
{
    private static $table_name = 'Element_Team';
    private static $controller_class = TeamElementController::class;
    private static $include_default_js = true;
    private static $include_default_css = true;

    private static $db = [
        'Content' => 'HTMLText',
        'ColsMobile' => 'Int',
        'ColsTablet' => 'Int',
        'ColsDesktop' => 'Int',
        'ColsLarge' => 'Int'
    ];

    private static $many_many = [
        'TeamMembers' => TeamMember::class
    ];

    const COLUMN_OPTIONS = [
        1 => 1,
        2 => 2,
        3 => 3,
        4 => 4,
        5 => 5,
        6 => 6,
        7 => 7,
        8 => 8,
        9 => 9,
        10 => 10,
        11 => 11,
        12 => 12
    ];

    public function getType()
    {
        return 'Team';
    }

    public function getSimpleClassName()
    {
        return 'bbp-team-element';
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->removeByName(['TeamMembers', 'ColsMobile', 'ColsTablet', 'ColsDesktop', 'ColsLarge']);
        $fields->addFieldsToTab('Root.Main', [
            CheckboxSetField::create(
                'TeamMembers',
                'Team Members to show',
                TeamMember::get()->map('ID', 'Name')
            )
        ]);

        $fields->addFieldsToTab('Root.Settings', [
            HeaderField::create('Number of columns to show:'),
            DropdownField::create('ColsMobile', 'Mobile columns', self::COLUMN_OPTIONS),
            DropdownField::create('ColsTablet', 'Tablet columns', self::COLUMN_OPTIONS),
            DropdownField::create('ColsDesktop', 'Desktop columns', self::COLUMN_OPTIONS),
            DropdownField::create('ColsLarge', 'Large screen columns', self::COLUMN_OPTIONS)
        ]);
        return $fields;
    }
}
