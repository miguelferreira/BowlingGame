package com.miguel.bowling.helper
{
	import com.miguel.utils.NumberUtils;

	public class BowlingNumber
	{
		public function BowlingNumber()
		{
		}
		
		public static function getNumberOfPinsDown(maxPins:uint = 10):uint
		{
			return NumberUtils.randomRange(0, maxPins);
		}
	}
}