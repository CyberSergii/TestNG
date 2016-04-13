package tp;//import org.junit.Test;
//
//import static junit.framework.TestCase.assertTrue;

import org.testng.annotations.*;

import static org.testng.AssertJUnit.assertTrue;

/**
 * @author sergii_vlasiuk@ukr.net.
 */
public class SubModule1Test {
  @BeforeClass
  public void beforeTest() {
    System.out.println("SubModule1Test.@BeforeClass.beforeTest");
  }

  @BeforeGroups
  public void beforeTest2() {
    System.out.println("SubModule1Test.@BeforeGroups.beforeTest");
  }

  @BeforeMethod
  public void beforeTest3() {
    System.out.println("SubModule1Test.@BeforeMethod.beforeTest");
  }

  @BeforeSuite
  public void beforeTest4() {
    System.out.println("SubModule1Test.@BeforeSuite.beforeTest");
  }

  @BeforeTest
  public void beforeTest5() {
    System.out.println("SubModule1Test.@BeforeTest.beforeTest");
  }

  @Test(singleThreaded = true, suiteName = "suite1")
  public void shouldAlwaysBeInvoked() {
    assertTrue("Should never fail and will ensure that the SubModule1Test is possible to execute", true);
  }

  @Test(groups = "external")
  public void testUsesExternalServices() {
    assertTrue("test uses external services should be ignored in most of times.", true);
  }

  @Test
  public void method1() {
    System.out.println("This is method 1");
  }

  @Test(dependsOnMethods = { "method1" })
  public void method2() {
    System.out.println("This is method 2");
  }

}
