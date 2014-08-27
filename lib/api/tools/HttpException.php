<?php
/**
 * WoWRoster.net WoWRoster
 *
 * @copyright  2002-2011 WoWRoster.net
 * @license    http://www.gnu.org/licenses/gpl.html   Licensed under the GNU General Public License v3.
 * @link       http://www.wowroster.net
 * @since      File available since Release 2.2.0
 * @package    WoWRoster
 * @version    SVN: $Id: HttpException.php 2353 2011-09-14 01:53:15Z ulminia@gmail.com $
 */

/**
 * HTTP Resource Exception
 */
class HttpException extends Exception {
	public function __construct($message=null, $code=500, Exception $previous = null) {
		if (is_array($message) && isset($message['status'], $message['reason'])) {
			$message = $message['status']. ": " . $message['reason'];
		} elseif($message === null) {
			$message = 'Unknown error occurred.';
		}
		parent::__construct($message, $code, $previous);
	}
}