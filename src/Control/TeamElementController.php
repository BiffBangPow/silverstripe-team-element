<?php

namespace BiffBangPow\Element\Control;

use BiffBangPow\Element\TeamElement;
use DNADesign\Elemental\Controllers\ElementController;
use SilverStripe\View\Requirements;
use SilverStripe\View\ThemeResourceLoader;

class TeamElementController extends ElementController
{
    protected function init()
    {
        parent::init();
        if (TeamElement::config()->get('include_default_js') === true) {
            Requirements::javascript('biffbangpow/silverstripe-team-element:client/dist/javascript/teamelement.js', [
                'defer' => true,
                'type' => false
            ]);
        }
        if (TeamElement::config()->get('include_default_css') === true) {
            Requirements::css('biffbangpow/silverstripe-team-element:client/dist/css/team.css', '', [
                'defer' => true
            ]);
        }
        $themeCSS = ThemeResourceLoader::inst()->findThemedCSS('client/dist/css/elements/team');
        if ($themeCSS) {
            Requirements::css($themeCSS, '', ['defer' => true]);
        }
    }
}
