//import org.junit.Test;
//
//import static junit.framework.TestCase.assertTrue;

import org.testng.annotations.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.testng.AssertJUnit.assertTrue;

/**
 * @author sergii_vlasiuk@ukr.net.
 */
public class SubModule3Test {
  private final static Logger LOGGER = LoggerFactory.getLogger(SubModule3Test.class);
  @Test(groups = {"junit", "integration"})
  public void shouldAlwaysBeInvoked() {
    LOGGER.info("Should never fail and will ensure that the SubModule3Test is possible to execute");
    LOGGER.warn("Should never fail and will ensure that the SubModule3Test is possible to execute");
    LOGGER.debug("Should never fail and will ensure that the SubModule3Test is possible to execute");
    LOGGER.trace("Should never fail and will ensure that the SubModule3Test is possible to execute");
    LOGGER.error("Should never fail and will ensure that the SubModule3Test is possible to execute");
    assertTrue("Should never fail and will ensure that the SubModule3Test is possible to execute", true);
  }
}
