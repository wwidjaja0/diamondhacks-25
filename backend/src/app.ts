import "dotenv/config";
import cors from "cors";
import express from "express";
import errorHandler from "./middlewares/errorHandler";
import userRoutes from "./routes/userRoutes";
import videoRoutes from "./routes/videoRoutes";

const app = express();

// initializes Express to accept JSON in the request/response body
app.use(express.json());

// sets the "Access-Control-Allow-Origin" header on all responses to allow
// requests from the frontend, which has a different origin
// https://expressjs.com/en/resources/middleware/cors.html
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin
app.use(
	cors({
		origin: process.env.FRONTEND_ORIGIN,
	})
);

app.use("/api/users", userRoutes);
app.use("/api/videos", videoRoutes);

app.use(errorHandler);

export default app;
