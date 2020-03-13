package fr.pbenoit.handler;

import com.agileandmore.slsemulator.SlsEmulator;
import com.agileandmore.slsruntime.ApiGatewayResponse;
import io.restassured.RestAssured;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import static io.restassured.RestAssured.given;
import static org.assertj.core.api.Assertions.assertThat;

public class ITWordHandlerTest {

    static SlsEmulator emulator = null;

    @BeforeClass
    public static void setUpClass() {
        emulator = new SlsEmulator();

        String endpointUrl = System.getProperty("endpoint.url");
        if (endpointUrl == null) {
            endpointUrl = "http://localhost:7070";
        }

        RestAssured.baseURI = endpointUrl;
        RestAssured.urlEncodingEnabled = true;
    }

    @AfterClass
    public static void tearDownClass() {
        emulator.stop();
    }

    /*
     * CreateWordHandler
     */

    @Test
    public void should_be_able_to_create_a_word() {
        String body = "{\n" +
                "  \"word\": \"Test\",\n" +
                "  \"description\": \"just a description\",\n" +
                "  \"quote\": \"just a quote\"\n" +
                "}";

        given()
                .contentType("application/json")
                .body(body)
                .when().post("api/v1/words")
                .then()
                .statusCode(201);
    }

    @Test
    public void should_not_be_able_to_create_a_word_when_the_object_is_invalid() {
        String body = "{\n" +
                "  \"wrong\": \"Wrong Test\",\n" +
                "  \"description\": \"just a description\",\n" +
                "  \"quote\": \"just a quote\"\n" +
                "}";

        given()
                .contentType("application/json")
                .body(body)
                .when().post("api/v1/words")
                .then()
                .statusCode(400);
    }

    /*
     * DeleteWordHandler
     */

    @Test
    public void should_be_able_to_delete_a_word() {
        given()
                .contentType("application/json")
                .pathParam("id", "good-id")
                .when().delete("api/v1/words/{id}")
                .then()
                .statusCode(204);
    }
}