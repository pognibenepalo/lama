package th.paloit.handler;

import com.agileandmore.slsruntime.ApiGatewayResponse;
import com.agileandmore.slsruntime.ParamsHelper;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import th.paloit.dao.LocalWordRepository;

import java.util.Map;

public class DeleteWordHandler implements RequestHandler<Map<String, Object>, ApiGatewayResponse> {

    @Override
    public ApiGatewayResponse handleRequest(Map<String, Object> input, Context context) {
        String id = ParamsHelper.getPathParameter("id", input);
        LocalWordRepository.remove(id);
        return ApiGatewayResponse.builder()
                .setStatusCode(204)
                .build();
    }
}
