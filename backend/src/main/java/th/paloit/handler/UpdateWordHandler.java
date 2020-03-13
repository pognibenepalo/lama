
package th.paloit.handler;

import com.agileandmore.slsruntime.ApiGatewayResponse;
import com.agileandmore.slsruntime.ParamsHelper;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import th.paloit.dao.LocalWordRepository;
import th.paloit.model.Word;

import java.util.Map;

public class UpdateWordHandler implements RequestHandler<Map<String, Object>, ApiGatewayResponse>{

    @Override
    public ApiGatewayResponse handleRequest(Map<String, Object> input, Context cntxt) {
        String id = ParamsHelper.getPathParameter("id", input);
        Word wordRequest;
        try {
            wordRequest = (new ObjectMapper()).readValue((String) input.get("body"), Word.class);
        } catch (JsonProcessingException e) {
            return ApiGatewayResponse.builder()
                    .setStatusCode(400)
                    .setRawBody("{\n" +
                            "  \"message\": \"Cannot read your request\"\n" +
                            "}")
                    .build();
        }
        LocalWordRepository.update(id, wordRequest);
        return ApiGatewayResponse.builder()
                .setStatusCode(200)
                .build();
    }
    
}
