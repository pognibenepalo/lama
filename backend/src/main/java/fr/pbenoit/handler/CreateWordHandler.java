package fr.pbenoit.handler;

import com.agileandmore.slsruntime.ApiGatewayResponse;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import fr.pbenoit.dao.LocalWordRepository;
import fr.pbenoit.model.Word;

import java.util.Map;

public class CreateWordHandler implements RequestHandler<Map<String, Object>, ApiGatewayResponse> {

    @Override
    public ApiGatewayResponse handleRequest(Map<String, Object> input, Context context) {
        Word wordRequest;
        try {
            wordRequest = (new ObjectMapper()).readValue((String) input.get("body"), Word.class);
        } catch (Exception e) {
            return ApiGatewayResponse.builder()
                    .setStatusCode(400)
                    .build();
        }

        LocalWordRepository.save(wordRequest);
        return ApiGatewayResponse.builder()
                .setStatusCode(201)
                .build();
    }
}
