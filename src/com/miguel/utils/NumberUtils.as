package com.miguel.utils
{
	public class NumberUtils
	{
		public function NumberUtils()
		{
		}
		
		public static function randomRange(minNum:Number, maxNum:Number):Number   
		{  
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);  
		}  
	}
}