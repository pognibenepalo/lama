package fr.pbenoit.handler;


import com.agileandmore.slsemulator.SlsEmulator;
import io.restassured.RestAssured;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.concurrent.TimeUnit;

/**
 * Because this test does not follow the defined naming convention for IT tests,
 * it is not executed automatically. To run it, select it specifically on the command line like:
 * mvn -Dtest=Runner -Dendpoint.url=http://localhost:7084 test
 * and then the server will run forever (stop with control-c)
 */
public class Runner {

    static SlsEmulator emulator = null;

    /**
     * Typically you would have a base test class with the logic to start and
     * stop the emulation, and you would inherit this class in your test
     * classes.
     */
    @BeforeClass
    public static void setUpClass() {
        emulator = new SlsEmulator();

        String endpointUrl = System.getProperty("endpoint.url");
        if (endpointUrl == null) {
            endpointUrl = "http://localhost:8080";
        }

        RestAssured.baseURI = endpointUrl;
        RestAssured.urlEncodingEnabled = true;
    }


    @Test
    public void should_keep_the_server_open_in_order_to_test_the_service_locally_with_the_frontend() {
        // NOTE: this a (kinda ugly) workaround for testing the user service locally, by default
        // this test is ignored (@Ignore)
        while (true) {
            try {
                TimeUnit.SECONDS.sleep(1);

            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    @AfterClass
    public static void tearDownClass() {
        emulator.stop();
    }

}
