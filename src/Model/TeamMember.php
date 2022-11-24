<?php

namespace BiffBangPow\Element\Model;

use BiffBangPow\Element\TeamElement;
use BiffBangPow\Extension\SortableExtension;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
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
        return $this->Name . ", " . $this->JobTitle;
    }
}

