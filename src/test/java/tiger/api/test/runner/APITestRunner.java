package tiger.api.test.runner;

import com.intuit.karate.junit5.Karate;

public class APITestRunner {

	@Karate.Test
	public Karate runTest() {
		return Karate.run("classpath:Features").tags("CreatAccount");
		
	}
	
}
