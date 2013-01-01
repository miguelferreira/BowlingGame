package flexUnitTests
{
	import com.miguel.bowling.helper.BowlingNumber;
	import com.miguel.utils.NumberUtils;
	
	import org.flexunit.asserts.assertTrue;

	public class BowlingNumberTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
			
		}
		
		[Test( description = "Get number of pins" )]
		public function canGenerateRandomNumber():void 
		{
			var numOfRadomNumbersCreated:uint = 500;
			var permitMinOfPinsDown:uint = 0;
			var permitMaxOfPinsDown:uint = 10;
			var output:int;
			
			for (var i:int = 0; i < numOfRadomNumbersCreated; i++)
			{
				output = BowlingNumber.getNumberOfPinsDown();
				assertTrue("- INCORRECT NUMBER OF PINS DOWN - Output: " + output , output >= permitMinOfPinsDown && output <= permitMaxOfPinsDown );
			}
			
		}
	}
}