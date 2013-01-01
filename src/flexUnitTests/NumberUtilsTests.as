package flexUnitTests
{
	import com.miguel.utils.NumberUtils;
	
	import org.flexunit.asserts.assertTrue;

	public class NumberUtilsTests
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
		
		[Test( description = "Generate Random Number" )]
		public function canGenerateRandomNumber():void 
		{
			var numOfRadomNumbersCreated:uint = 500;
			var inputMin:uint = 0;
			var inputMax:uint = 10;
			var output:int;
			
			for (var i:int = 0; i < numOfRadomNumbersCreated; i++)
			{
				output = NumberUtils.randomRange(inputMin, inputMax);
				assertTrue("- Random Created NOT correctly -" + " Min: " + inputMin + " - Max: " + inputMax+ "\/ Output: " + output , output >= inputMin && output <= inputMax )
			}

		}
	}
}