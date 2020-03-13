package fr.pbenoit.handler;

import com.agileandmore.slsruntime.ApiGatewayResponse;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import fr.pbenoit.dao.LocalWordRepository;

import java.util.Map;

public class GetWordHandler implements RequestHandler<Map<String, Object>, ApiGatewayResponse> {

    @Override
    public ApiGatewayResponse handleRequest(Map<String, Object> i, Context cntxt) {
        return ApiGatewayResponse.builder()
                .setStatusCode(200)
                .setObjectBody(LocalWordRepository.get())
                .build();
    }

}
