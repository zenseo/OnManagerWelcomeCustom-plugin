//<?php
/**
 * OnManagerWelcomeCustom
*
*
* @category plugin
* @version 1.0
* @license http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
* @internal @events OnManagerWelcomePrerender, OnManagerWelcomeHome, OnManagerWelcomeRender
* @internal @installset base
* @internal @modx_category Welcome
* @internal @disabled 1
*/

/*  OnManagerWelcomeCustom for Devo Manager Themes
Instructions:
check event:
OnManagerWelcomePrerender - to activate custom logo - logo url in chunk Welcome_YourLogo
OnManagerWelcomeHome - to activate last social links - links code in chunk Welcome_SocialLinks
OnManagerWelcomeRender  - custom links - links code in chunk Welcome_CustomLinks


*/
$e = &$modx->Event;
$output ='';

switch($e->name) {

		/*OnManagerWelcomeHome - social links */
	/*OnManagerWelcomePrerender - custom logo */
    case 'OnManagerWelcomePrerender':
     		$output = $modx->getChunk('Welcome_YourLogo');
    break;
		/*OnManagerWelcomeHome - social links */
    case 'OnManagerWelcomeHome':
      $output = '<div class="dashboard-block-full"> <div class="sectionHeader"><i class="fa fa-globe"></i> Social<a href="javascript:void(null);" onclick="doHideShow(\'idShowHide8\');"><i class="fa fa-bars expandbuttn"></i></a></div>
			<div id="idShowHide8" class="sectionBody">'.$modx->getChunk('Welcome_SocialLinks').' <br style="clear:both;height:1px;margin-top: -1px;line-height:1px;font-size:1px;" /> </div></div>';

    break;
	/*OnManagerWelcomeRender - custom links */
    case 'OnManagerWelcomeRender':
      $output = '<div class="dashboard-block-full"> <div class="sectionHeader"><i class="fa fa-tachometer"></i> Links<a href="javascript:void(null);" onclick="doHideShow(\'idShowHide9\');"><i class="fa fa-bars expandbuttn"></i></a></div>
			<div id="idShowHide9" class="sectionBody">'.$modx->getChunk('Welcome_CustomLinks').' <br style="clear:both;height:1px;margin-top: -1px;line-height:1px;font-size:1px;" /> </div></div>';

    break;
    default:
        $output = '';
    break;
}

$e->output($output);

return;