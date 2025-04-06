/**
 * Parses .env parameters and ensures they are of required types. If any .env parameters are
 * missing, the server will not start and an error will be thrown.
 */

import { cleanEnv } from "envalid";
import { port, str } from "envalid/dist/validators";

export default cleanEnv(process.env, {
	PORT: port(),
	MONGODB_URI: str(),
	FRONTEND_ORIGIN: str(),
	AWS_BUCKET_NAME: str(),
	AWS_ACCESS_KEY_ID: str(),
	AWS_SECRET_ACCESS_KEY: str(),
	AWS_REGION: str(),
});
