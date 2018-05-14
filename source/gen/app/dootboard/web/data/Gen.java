package gen.app.dootboard.web.data;

import org.jooq.util.GenerationTool;
import org.jooq.util.jaxb.Configuration;

public class Gen {

    public static void gen(Configuration conf) throws Exception {
        GenerationTool.generate(conf);
    }
}
