<?php

namespace BiffBangPow\Element;

use BiffBangPow\Element\Model\TeamMember;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\CheckboxSetField;

class TeamElement extends BaseElement
{
    private static $table_name = 'Element_Team';

    private static $db = [
        'Content' => 'HTMLText'
    ];

    private static $many_many = [
        'TeamMembers' => TeamMember::class
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
        $fields->addFieldsToTab('Root.Main', [
            CheckboxSetField::create(
                'TeamMembers',
                'Team Members to show',
                TeamMember::get()->map('ID', 'Name')
            )
        ]);
        return $fields;
    }
}
