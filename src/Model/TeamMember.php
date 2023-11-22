<?php

namespace BiffBangPow\Element\Model;

use BiffBangPow\Element\TeamElement;
use BiffBangPow\Extension\SortableExtension;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Core\Extensible;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\FieldType\DBHTMLText;
use SilverStripe\ORM\FieldType\DBVarchar;

/**
 * @property DBVarchar Name
 * @property DBVarchar JobTitle
 * @property DBHTMLText Bio
 * @property DBVarchar LinkedIn
 * @property DBVarchar Email
 * @property DBVarchar Phone
 * @method Image Image()
 */
class TeamMember extends DataObject
{

    private static $table_name = 'TeamMember';
    private static $db = [
        'Name' => 'Varchar',
        'JobTitle' => 'Varchar',
        'Summary' => 'HTMLText',
        'Bio' => 'HTMLText',
        'LinkedIn' => 'Varchar',
        'Email' => 'Varchar',
        'Phone' => 'Varchar'
    ];
    private static $has_one = [
        'Image' => Image::class
    ];
    private static $owns = [
        'Image'
    ];
    private static $extensions = [
        SortableExtension::class
    ];
    private static $summary_fields = [
        'Name' => 'Name',
        'JobTitle' => 'JobTitle'
    ];
    private static $belongs_many_many = [
        'Element' => TeamElement::class
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->removeByName(['Element']);
        $fields->addFieldsToTab('Root.Main', [
            UploadField::create('Image')
                ->setAllowedFileCategories('image/supported')
                ->setFolderName('Team')
        ]);
        return $fields;
    }


    /**
     * Gets a concatenated name / job title for the member
     * @return string
     */
    public function getTitle() :string
    {
        $title = $this->Name . ", " . $this->JobTitle;
        $this->extend('updateTeamTitle', $title);
        return $title;
    }

    /**
     * Gets the phone number for the team member
     * @return DBVarchar
     */
    public function getTeamMemberPhone() {
        $phone = $this->Phone;
        $this->extend('updatePhoneNumber', $phone);
        return $phone;
    }
}

